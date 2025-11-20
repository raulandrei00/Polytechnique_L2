#include<bits/stdc++.h>
using namespace std;
using ll = long long;

struct SuffixArray {
    vector<int> sa, lcp;
    SuffixArray (string s, int lim = 256) {
        s.push_back(0); int n = s.size(), k = 0, a,b;
        vector<int> x(s.begin(),s.end()), y(n), ws(max(n, lim));

        sa = lcp = y;
        iota(sa.begin(), sa.end(), 0);
        for (int j = 0, p = 0; p < n; j = max(1, j*2), lim=p) {
            p = j, iota (y.begin(), y.end(), n-j);
            for (int i = 0; i < n; ++i) if (sa[i] >= j) y[p++] = sa[i] - j;
            fill(ws.begin(), ws.end(), 0);
            for (int i = 0; i < n; i++)ws[x[i]]++;
            for (int i = 1; i < lim; i++) ws[i] += ws[i-1];
            for (int i = n; i--; ) sa[--ws[x[y[i]]]] = y[i];
            swap(x, y), p=1, x[sa[0]] = 0;
            for (int i = 1; i < n; i++) a = sa[i-1], b = sa[i], x[b] = (y[a] == y[b] && y[a+j] == y[b+j]) ? p-1 : p++;
            
        }
        for (int i = 0, j; i < n-1; lcp[x[i++]] = k) 
            for (k && k--, j = sa[x[i] - 1]; s[i+k] == s[j+k]; k++);

    }
};


struct suffix {
    int pos, rank0, rank1;

    bool operator < (suffix b) {
        if (b.rank0 != rank0)
            return rank0 < b.rank0;
        return rank1 < b.rank1;
    }
};

const int MAX_N = (1 << 18);
suffix suff[MAX_N];
int pos[MAX_N];

int main () {
    int k, t;
    cin >> k >> t;

    string s;
    cin >> s;

    int pp = t % k;

    for (int i = 0; i < (1 << k); i++) {
        suff[i].pos = i;
        suff[i].rank0 = s[i] - 'a';
        suff[i].rank1 = 0;
    }

    sort(suff, suff + (1 << k));

    //printf("%d\n", pp);
    int coef = (1 << (k - pp));
    for (int pas = 0; pas < pp; pas++) {
        suffix prv = {-1, -1, -1};
        int g = 0;
        for (int i = 0; i < (1 << k); i++) {
            if (!(prv.rank0 == suff[i].rank0 && prv.rank1 == suff[i].rank1))
                g++;
            prv = suff[i];
            suff[i].rank0 = g;
            pos[suff[i].pos] = i;
        }

        for (int i = 0; i < (1 << k); i++)  {
            int nxt = (i + coef * (1 << pas)) & ((1 << k) - 1);
            //printf("%d->%d %c %c %d %d\n", i, nxt, s[i], s[nxt], pos[nxt], suff[pos[nxt]].rank0);
            suff[pos[i]].rank1 = suff[pos[nxt]].rank0;
        }

        sort(suff, suff + (1 << k));

        
        //for (int i = 0; i < (1 << k); i++)
        //    printf("%d %d %d\n", suff[i].pos, suff[i].rank0, suff[i].rank1);
        //printf("\n");
    }
    for (int pas = 0; pas < k - pp; pas++) {
        suffix prv = {-1, -1, -1};
        int g = 0;
        for (int i = 0; i < (1 << k); i++) {
            if (!(prv.rank0 == suff[i].rank0 && prv.rank1 == suff[i].rank1))
                g++;
            prv = suff[i];
            suff[i].rank0 = g;
            pos[suff[i].pos] = i;
        }

        for (int i = 0; i < (1 << k); i++) {
            int nxt = (i + (1 << pas)) & ((1 << k) - 1);
            suff[pos[i]].rank1 = suff[pos[nxt]].rank0;
        }
        
        sort(suff, suff + (1 << k));
    }

    int posstart = suff[0].pos;
    //cout << posstart << "\n";

    string tt = s;
    for (int i = 0; i < (1 << k); i++)
        tt[(i + (1 << k) - posstart) % (1 << k)] = s[i];
    s = tt;

    for (int i = 0; i < (1 << (k - pp)); i++) {
        for (int j = 0; j < (1 << pp); j++)
            cout << s[i + j * coef];
    }
    
    
    return 0;
}