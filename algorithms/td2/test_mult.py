# -*- coding: utf-8 -*-
import mult as mult
import matplotlib.pyplot as plt
import sys

def str_poly(p):
    s = ""
    first = True
    for i, x in enumerate(p):
        if x == 0:
            continue
        if x >= 0 and not first:
            s += "+"
        if x != 1 and x != -1:
            s += "{}".format(x)
        if x == -1:
            s += "-"
        if x == 1 and i == 0:
            s += "1"
        if i == 1:
            s += "x"
        if i > 1:
            s += "x^{}".format(i)
        first = False
    if s == "":
        return "0"
    else:
        return s

def equal_poly(p1, p2):
    for i in range(max(len(p1), len(p2))):
        x1 = p1[i] if i < len(p1) else 0
        x2 = p2[i] if i < len(p2) else 0
        if x1 != x2:
            return False
    return True

assert equal_poly([1, 2], [1, 2, 0])
assert equal_poly([1, 2, 0, 0], [1, 2])
assert not equal_poly([1, 2, 0, 3], [1, 2])

def check_mult(fn, p1, p2, pres):
    tmp = fn(p1, p2)
    if not equal_poly(tmp ,pres):
        print(f"your product of {str_poly(p1)} and {str_poly(p2)} returned {str_poly(tmp)} instead of {str_poly(pres)}")
        return False
    return True

def check_add(fn, p1, p2, pres):
    tmp = fn(p1, p2)
    if not equal_poly(tmp ,pres):
        print(f"your addition of {str_poly(p1)} and {str_poly(p2)} returned {str_poly(tmp)} instead of {str_poly(pres)}")
        return False
    return True

def check_cost_mult(fn, ins, outs):
    for i in range(len(ins)):
        tmp = fn(ins[i])
        if tmp != outs[i]:
            print("your product cost function for two polynomials of size {} returned {} instead of {}".format(ins[i], tmp, outs[i]))
            return False
    return True

def test1():
    if mult.poly_mult([0], [0]) is None:
        print("skipping poly_mult (unimplemeneted)")
        return
    print(f"Testing poly_mult...\t\t", end="")
    res = check_mult(mult.poly_mult, [0], [0], [0]) \
        and check_mult(mult.poly_mult, [1, 2, 3], [4, 5, 6, 7], [4, 13, 28, 34, 32, 21]) \
        and check_mult(mult.poly_mult, [1,4,7,2,3,5,9], [3,7,-8,9,-1,-2,5], [3, 19, 41, 32, 2, 77, 46, 54, 1, 80, -4, 7, 45])
    if res:
        print ("[ok]")

def test1b():
    if mult.cost_poly_mult(1) is None:
        print("skipping cost_poly_mult (unimplemeneted)")
        return
    print(f"Testing cost_poly_mult...\t", end="")
    if check_cost_mult(mult.cost_poly_mult, [1, 2, 3], [1, 5, 13]):
        print("[ok]")

def test2a():
    if mult.poly_add([0], [0]) is None:
        print("skipping poly_add (unimplemeneted)")
        return
    print(f"Testing poly_add...\t\t", end="")
    res = check_add(mult.poly_add, [42], [56], [98]) \
        and check_add(mult.poly_add, [1, 2, 3], [4, 5, 6, 7, 12], [5, 7, 9, 7, 12])
    if res:
        print("[ok]")

def test2b():
    if mult.neg([0]) is None:
        print("skipping neg (unimplemeneted)")
        return
    print(f"Testing neg...\t\t\t", end="")
    p = [0, 1, -2, 3, -4, 5]
    tmp = mult.neg(p)
    res = [0, -1, 2, -3, 4, -5]
    if tmp != res:
        print(f"your negation of {str_poly(p)} returned {str_poly(tmp)} instead of {str_poly(res)}")
        return
    # make sure neg did not modify the array p
    if p != [0, 1, -2, 3, -4, 5]:
        print("your negation function modified the array passed as a parameter, do not do that!")
        return
    print("[ok]")

def test2c():
    if mult.shift([0], 0) is None:
        print("skipping shift (unimplemeneted)")
        return
    print(f"Testing shift...\t\t", end="")
    p = [0, 1, -2, 3, -4, 5]
    for i in range(3):
        tmp = mult.shift(p, i)
        res = [0]*i + p
        if tmp != res:
            print("your shift of {} by {} returned {} instead of {}".format(str_poly(p), i, str_poly(tmp), str_poly(res)))
            return
    print("[ok]")

def test3():
    if mult.poly_kara_mult([0], [0]) is None:
        print("skipping poly_kara_mult (unimplemeneted)")
        return
    print(f"Testing poly_kara_mult...\t", end="")
    res = check_mult(mult.poly_kara_mult, [0], [0], [0]) \
        and check_mult(mult.poly_kara_mult, [1, 2, 3, 0], [4, 5, 6, 7], [4, 13, 28, 34, 32, 21]) \
        and check_mult(mult.poly_kara_mult, [1,4,7,2,3,5,9], [3,7,-8,9,-1,-2,5], [3, 19, 41, 32, 2, 77, 46, 54, 1, 80, -4, 7, 45])
    if res:
        print("[ok]")

def test3b():
    if mult.cost_poly_kara_mult(1) is None:
        print("skipping cost_poly_kara_mult (unimplemeneted)")
        return
    print(f"Testing cost_poly_kara_mult...\t", end="")
    if check_cost_mult(mult.cost_poly_kara_mult, range(1, 15), [1, 11, 45, 49, 155, 159, 175, 179, 501, 505, 521, 525, 577, 581]):
        print("[ok]")

def test4():
    if mult.cost_poly_tc3_mult(1) is None:
        print("skipping cost_poly_tc3_mult (unimplemeneted)")
        return
    print(f"Testing cost_poly_tc3_mult...\t", end="")
    if check_cost_mult(mult.cost_poly_tc3_mult, range(1, 15), [1, 3, 95, 135, 165, 195, 685, 715, 745, 975, 1005, 1035, 1215, 1245]):
        print("[ok]")

def trace_poly_switch_mult(frame, event, arg):
    if event != 'call':
        return
    co = frame.f_code
    func_name = co.co_name
    if func_name == 'poly_kara_mult':
        raise RuntimeError("your function poly_switch_mult called poly_kara_mult which is incorrect")

def test5():
    if mult.poly_switch_mult(1, [0], [0]) is None:
        print("skipping poly_switch_mult (unimplemeneted)")
        return
    print(f"Testing poly_switch_mult...\t", end="")
    try:
        sys.settrace(trace_poly_switch_mult)
        for d in range(1, 10):
            fn = lambda p,q: mult.poly_switch_mult(d, p, q)
            if not (check_mult(fn, [0], [0], [0]) \
                    and check_mult(fn, [1, 2, 3, 0], [4, 5, 6, 7], [4, 13, 28, 34, 32, 21]) \
                    and check_mult(fn, [1,4,7,2,3,5,9], [3,7,-8,9,-1,-2,5], [3, 19, 41, 32, 2, 77, 46, 54, 1, 80, -4, 7, 45])):
                return
        print("[ok]")
    finally:
        sys.settrace(None)

def test5b():
    if mult.cost_switch_mult(3, 1) is None:
        print("skipping cost_switch_mult (unimplemeneted)")
        return
    print(f"Testing cost_switch_mult...\t", end="")
    if check_cost_mult(lambda n: mult.cost_switch_mult(3, n), range(1, 15), [1, 5, 13, 31, 59, 63, 121, 125, 213, 217, 233, 237, 415, 419]):
        print("[ok]")

test1()
test1b()
test2a()
test2b()
test2c()
test3()
test3b()
test4()
test5()
test5b()

#################################################
###       CODE TO COMPARE COSTS (GIVEN)       ###
#################################################

def compare_kara_tc3(nmax = 90000, step = 0):
    if step == 0:
        step = nmax//200
    
    x = [n for n in range(1,nmax,step)]
    data_kara = [mult.cost_poly_kara_mult(n) for n in x]
    data_tc3 = [mult.cost_poly_tc3_mult(n) for n in x]
    
    plt.plot(x,data_kara, color="red", label="cost_karatsuba")
    plt.plot(x,data_tc3, color="blue", label="cost_tc3")
    plt.title("Evolution of # of coefficient operations")
    plt.legend(loc='upper left')
    plt.show() 

def compare_kara_switch(L, nmax = 90000, step = 0):
    col = ['green', 'purple', 'yellow', 'black', 'grey', 'brown', 'cyan', 'magenta']
    assert len(L) <= len(col), "too many values of d"
    if step == 0:
        step = nmax//200
    
    x = [n for n in range(1,nmax,step)]
    data_kara = [mult.cost_poly_kara_mult(n) for n in x]
    data_tc3 = [mult.cost_poly_tc3_mult(n) for n in x]
    
    plt.plot(x,data_kara, color="red", label="cost_karatsuba")
    plt.plot(x,data_tc3, color="blue", label="cost_tc3")
    for i,d in enumerate(L):
        data_d = [mult.cost_switch_mult(d, n) for n in x]
        plt.plot(x,data_d, color=col[i], label="cost_switch(d={})".format(d))
    plt.title("Evolution of # of coefficient operations")
    plt.legend(loc='upper left')
    plt.show() 

# uncomment to compare
# compare_kara_tc3()

# uncomment to compare
# compare_kara_switch([2,4,8, 32, 64]) # tweak list of values of d to conclude
