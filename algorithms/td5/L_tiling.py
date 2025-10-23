# Question 1



def middleL(n, i, j, a, b): # returns the middle of the punctured grid of type (n, i, j, a, b)
    #
    x , y = 0,0
    if a >= i + 2 ** (n-1):
        x = 1
    if b >= j + 2 ** (n-1):
        y = 1
    
    ret = {(i+2**(n-1)-1 , j+2**(n-1)-1) , (i+2**(n-1)-1 , j+2**(n-1)) , (i+2**(n-1), j+2**(n-1)-1) , (i+2**(n-1), j+2**(n-1))}
    ret.remove((i+2**(n-1) -1 + x , j+2**(n-1) -1 + y))
    return [_ for _ in ret]

# Question 2
def lower_left_hole(n, i, j, a, b): # returns the coordinates of the hole of the lower left quadrant
    ret = {(i+2**(n-1)-1 , j+2**(n-1)-1) , (i+2**(n-1)-1 , j+2**(n-1)) , (i+2**(n-1), j+2**(n-1)-1) , (i+2**(n-1), j+2**(n-1))}
    comp = set(middleL(n, i, j, a, b))
    dif = [_ for _  in ret.difference(comp)]
    x,y = dif[0][0] - (i+2**(n-1)-1) , dif[0][1] - (j+2**(n-1)-1)
    if (x,y) == (0,0):
        return a,b
    else: return i+2**(n-1)-1,j+2**(n-1)-1

def lower_right_hole(n, i, j, a, b): # returns the coordinates of the hole of the lower right quadrant
    ret = {(i+2**(n-1)-1 , j+2**(n-1)-1) , (i+2**(n-1)-1 , j+2**(n-1)) , (i+2**(n-1), j+2**(n-1)-1) , (i+2**(n-1), j+2**(n-1))}
    comp = set(middleL(n, i, j, a, b))
    dif = [_ for _  in ret.difference(comp)]
    x,y = dif[0][0] - (i+2**(n-1)-1) , dif[0][1] - (j+2**(n-1)-1)
    if (x,y) == (1,0):
        return a,b
    else: return i+2**(n-1),j+2**(n-1)-1

def upper_left_hole(n, i, j, a, b): # returns the coordinates of the hole of the upper left quadrant
    ret = {(i+2**(n-1)-1 , j+2**(n-1)-1) , (i+2**(n-1)-1 , j+2**(n-1)) , (i+2**(n-1), j+2**(n-1)-1) , (i+2**(n-1), j+2**(n-1))}
    comp = set(middleL(n, i, j, a, b))
    dif = [_ for _  in ret.difference(comp)]
    x,y = dif[0][0] - (i+2**(n-1)-1 ), dif[0][1] - (j+2**(n-1)-1)
    if (x,y) == (0,1):
        return a,b
    else: return i+2**(n-1)-1,j+2**(n-1)

def upper_right_hole(n, i, j, a, b): # returns the coordinates of the hole of the upper right quadrant
    ret = {(i+2**(n-1)-1 , j+2**(n-1)-1) , (i+2**(n-1)-1 , j+2**(n-1)) , (i+2**(n-1), j+2**(n-1)-1) , (i+2**(n-1), j+2**(n-1))}
    comp = set(middleL(n, i, j, a, b))
    dif = [_ for _  in ret.difference(comp)]
    x,y = dif[0][0] - (i+2**(n-1)-1 ), dif[0][1] - (j+2**(n-1)-1)
    if (x,y) == (1,1):
        return a,b
    else: return i+2**(n-1),j+2**(n-1)

# Question 3

def _tile(n, i, j, pair_hole): # returns a list with a valid L-tiling of the punctured grid of type (n, i, j, a, b)
    a,b = pair_hole
    if (n == 0): return []
    first_tile = middleL(n, i, j, pair_hole[0], pair_hole[1])
    
    return [first_tile] + _tile(n-1 , i , j , lower_left_hole(n,i,j,a,b)) + \
                 _tile(n-1, i+2**(n-1),j,lower_right_hole(n,i,j,a,b)) + _tile(n-1 , i+2**(n-1),j+2**(n-1) , upper_right_hole(n,i,j,a,b)) \
                + _tile(n-1 , i , j+2**(n-1) , upper_left_hole(n,i,j,a,b))

def tile (n,i,j,a,b):
    return _tile(n,i,j,(a,b))