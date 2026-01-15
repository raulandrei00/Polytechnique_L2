try:
    from dg import *
except Exception:
    pass


# Question 5
def contains_pattern(s, text):
    s = "(.)*" + s + "(.)*"
    nfa = NFA(s)
    return nfa.check_text(text)

class NFA:
    def __init__(self, s): # s is the string containing the regular expression
        self.s = s
        self.m = len(self.s)
        self.dg = DG(len(s) + 1) # the directed graph that stores the epsilon links
        self.lp = [-1 for _ in range(len(s))]
        self.rp = [-1 for _ in range(len(s))]
        self.left_right_match_or() # assigns lp and rp according to parentheses matches
        self.build_eps_links() # assigns the epsilon links in self.dg

    def __str__(self):
        n = self.m
        str_lp = 'lp: '
        str_rp = 'rp: '
        for i in range(self.m):
            if self.lp[i] == -1:
                str_lp += '-1  '
            elif self.lp[i] < 10:
                str_lp += str(self.lp[i]) + '   '
            else: str_lp += str(self.lp[i]) + '  '
            if self.rp[i] == -1:
                str_rp += '-1  '
            elif self.rp[i] < 10:
                str_rp += str(self.rp[i]) + '   '
            else: str_rp += str(self.rp[i]) + '  '
        str_lp += '\n'
        str_rp += '\n'

        str_dg = str(self.dg)

        s = '------------------\nRegular expression\n------------------\n' + 're: ' + '   '.join(self.s) + '\n'
        return s + str_lp + str_rp #+ '------------------\nCorresponding NFA\n------------------\n' + str_dg

    ## Question 1
    def left_right_match(self):
        opening = []
        for i in range(len(self.s)):
            if self.s[i] == '(':
                opening.append(i)
            elif self.s[i] == ')':
                if len(opening) == 0:
                    raise Exception("Unmatched closing parenthesis at index " + str(i))
                j = opening.pop()
                self.lp[i] = j
                self.rp[j] = i

    ## Question 2
    def left_right_match_or(self):
        opening = []
        self.left_right_match()
        for i in range(len(self.s)):
            if self.s[i] == '|':
                if len(opening) == 0:
                    raise Exception("Unmatched '|' at index " + str(i))
                j = opening[-1]
                self.lp[i] = j
                self.rp[i] = self.rp[j]
            elif self.s[i] == '(':
                opening.append(i)
            elif self.s[i] == ')':
                if len(opening) == 0:
                    raise Exception("Unmatched closing parenthesis at index " + str(i))
                j = opening.pop()
                

    ## Question 3
    def build_eps_links(self):
        for i in range(len(self.s)):
            if self.s[i] in ('(',')','*'):
                self.dg.add_link(i, i + 1)
            if self.s[i] == '*':
                lp_idx = self.lp[i - 1]
                self.dg.add_link(lp_idx, i)
                self.dg.add_link(i, lp_idx)
            if self.s[i] == '|':
                rp_idx = self.rp[i]
                self.dg.add_link(i, rp_idx)
                lp_idx = self.lp[i]
                self.dg.add_link(lp_idx, i + 1)

    ## Question 4
    # Complexity: O(n * (m + O(explore_from_subset))) == O(n * m)
    # Because: each explore_from_subset call takes O(m) time (epsilon links are O(m))
    # then, we loop through n characters of w, leading to O(n * m) overall.
    def check_text(self, w):
        current_states = self.dg.explore_from_subset([0])
        for char in w:
            next_states = []
            for state in current_states:
                if state < self.m and (self.s[state] == char or self.s[state] == '.'):
                    next_states.append(state + 1)
            current_states = self.dg.explore_from_subset(next_states)
        return self.m in current_states
