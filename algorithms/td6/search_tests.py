# -*- coding: utf-8 -*-

from search import *
import numpy as np
import random
import string
import time
import signal
import matplotlib.pyplot as plt

grading_mode=False

def implemented(algo, T, P, Q = None):
    res = algo(T,P) if Q is None else algo(T,P,Q)
    return res is not None 

def test_basic(algo, oPos, oFalse, T, P, Q = None):
    res = algo(T,P) if Q is None else algo(T,P,Q)
    if oFalse is not None:
        assert isinstance(res, tuple) and len(res) == 2
        rPos = res[0]
        rFalse = res[1]
    else:
        rPos = res
        rFalse = None
        
    equal = np.array_equal(rPos, oPos) and rFalse == oFalse
    if not equal:
        assert not grading_mode
    return equal, res

def test_print(algo, O, T, P, Q = None):
    print(f"Testing T= {T}, P = {P}", end="")
    if Q is not None: print(f" (prime {Q})", end="")
    if isinstance(O, tuple) and len(O) == 2:
        pos = O[0]
        fh = O[1]
    else:
        pos = O
        fh = None
    print(f": match(es) at position(s) {pos}", end="")
    if fh is not None:
        print(f", ({fh} false hits)", end="")
    print("...\t", end="")
    res = test_basic(algo, pos, fh, T, P, Q)
    if res[0]:
        print("[OK]")
    else:
        print(f"[NOK]\tReturned {res[1]}")

def handler(signum, frame):
    raise Exception("timeout")

signal.signal(signal.SIGALRM, handler)

timeout = 3 # seconds
    
def test_hash_sum(algo, O, S, Q = None):
    print(f"Testing S={S if len(S) < 20 else '<very long>'}: hash sum {O}", end="")
    if Q is not None:
        print (f" (prime {Q})", end="")
    print("...\t", end="")
    try:
        signal.alarm(timeout)
        res = algo(S) if Q is None else algo(S, Q)
        signal.alarm(0)
        if res == O:
            print("[OK]")
        else:
            assert not grading_mode
            print(f"[NOK]\t Returned {res}")
    except:
        print("Timeout")

def test_hash_update(algo, O, h, Ti, Tim, Q = None, dm = None):
    print(f"Testing h={h}, Ti={Ti}, Tim={Tim}: updated hash {O}", end="")
    if Q is not None:
        print (f" (prime {Q})", end="")
    print("...\t", end="")
    res = algo(h, Ti, Tim) if Q is None else algo(h, Ti, Tim, Q, dm)
    if res == O:
        print("[OK]")
    else:
        assert not grading_mode
        print(f"[NOK]\t Returned {res}")

def test1():
    print("\nQuestion 1: string_match()")
    if string_match('ab', 'a') is None:
        print("Not implemented")
    else:
        test_print(string_match, [6], 'abacadabra', 'abra')
        test_print(string_match, [0,7], 'abracadabra', 'abra')
        test_print(string_match, [0,2,4], 'abababab', 'abab')

def test2():
    print("\nQuestion 2: hash_string_sum()")
    if hash_string_sum('ab') is None:
        print("Not implemented")
    else:
        test_hash_sum(hash_string_sum, 97, 'a')
        test_hash_sum(hash_string_sum, 1108, 'abracadabra')

def test3():
    print("\nQuestion 3: hash_string_sum_update()")
    if hash_string_sum_update(100,'a','c') is None:
        print("Not implemented")
    else:
        test_hash_sum(hash_string_sum_update, 408, 406, 'a', 'c')

def test4():
    print("\nQuestion 4: karp_rabin_sum()")
    if karp_rabin_sum('ab','a') is None:
        print("Not implemented")
    else:
        test_print(karp_rabin_sum, ([6],1), 'abacaaabra', 'abra')
        test_print(karp_rabin_sum, ([0,7],1), 'abracaaabra', 'abra')
        test_print(karp_rabin_sum, ([0,2,4],2), 'abababab', 'abab')

def time_krsum_worst(nmax, maxseq):
    if karp_rabin_sum('ab','a') is None:
        return
    
    nrun = 5
    x = range(maxseq, nmax+1,2)
    ynaive = []
    ykrsum = []
    ykr = []

    ms2 = maxseq//2
    usekr = False

    P = ('a'*(maxseq-1))+'b' #('a'*ms2) + ('b'*ms2)
    for i in x:
        T = ('a'*(maxseq-1)+'b')*(i//maxseq) + 'a'*(i%maxseq)

        t = time.time()
        for _ in range(nrun):
            mkrsum,sh = karp_rabin_sum(T, P)
        t = time.time() - t
        ykrsum.append(t)

        #print(i,sh)
        t = time.time()
        for _ in range(nrun):
            mnaive = string_match(T, P)
        t = time.time() - t
        ynaive.append(t)

        if not mnaive == mkrsum:
            print("error",i, mnaive, mkrsum)

    plt.plot(x,ynaive,color='blue', label='naive')
    plt.plot(x, ykrsum, color='red', label='karp_rabin_sum')
    if usekr:
        plt.plot(x,ykr, color='green', label='karp_rabin')
    plt.legend(loc='upper left')
    plt.title("running time")
    plt.show()

def test_krsum_worst_case():
    time_krsum_worst(1000,100)

def test5_1():
    print("\nQuestion 5.1: hash_string_mod()")
    if hash_string_mod('ab',3) is None:
        print("Not implemented")
    else:
        test_hash_sum(hash_string_mod, 145, 'abacaaabra', 181)
        test_hash_sum(hash_string_mod, 8, 'abracaaabra', 181)
        test_hash_sum(hash_string_mod, 3, 'abacaaabra', 7)
        test_hash_sum(hash_string_mod, 4, 'abracaaabra', 7)
        test_hash_sum(hash_string_mod, 92, 'z'*111200, 181)

def test5_2():
    print("\nQuestion 5.2: hash_string_mod_update()")
    if hash_string_mod_update(100,'a','c',181,10) is None:
        print("Not implemented")
    else:
        test_hash_update(hash_string_mod_update, 10, 11, 'a', 'a', 181, 145)
        test_hash_update(hash_string_mod_update, 12, 11, 'a', 'c', 181, 145)
        test_hash_update(hash_string_mod_update, 6, 6, 'a', 'a', 7, 1)
        test_hash_update(hash_string_mod_update, 1, 6, 'a', 'c', 7, 1)

def test5_3():
    print("\nQuestion 5.3: karp_rabin_mod()")
    if not implemented(karp_rabin_mod,'ab','a',181):
        print("Not implemented")
    else:
        test_print(karp_rabin_mod, ([6], 0), 'abacaaabra', 'abra', 181)
        test_print(karp_rabin_mod, ([0,7], 0), 'abracaaabra', 'abra', 181)
        test_print(karp_rabin_mod, ([6], 1), 'abacaaabra', 'abra', 7)
        test_print(karp_rabin_mod, ([0,7], 1), 'abracaaabra', 'abra', 7)
        test_print(karp_rabin_mod, ([0,2,4], 0), 'abababab', 'abab', 7)
        test_print(karp_rabin_mod, ([0,2,4], 2), 'abababab', 'abab', 3)

def test_krmod_primes():
    if not implemented(karp_rabin_mod,'ab','a',181):
        return

    # random 8,16,32 and 64 bit primes
    q8 = 181
    q16 = 14107
    q32 = 1674011477
    q64 = 5229701266470813371

    maxm = 1000

    x = range(2, maxm+1,10)

    y8 = []
    y16 = []
    y32 = []
    y64 = []

    fm8 = []
    fm16 = []
    fm32 = []
    fm64 = []

    for m in x:
        n = m*100
        T=''
        for _ in range(n):
            T+=random.choice(string.ascii_lowercase)
        P=''
        for _ in range(m):
            P+=random.choice(string.ascii_lowercase)

        t = time.time()
        match,fmatch = karp_rabin_mod(T, P, q8)
        t = time.time() - t
        y8.append(t)
        fm8.append(fmatch)


        t = time.time()
        match,fmatch = karp_rabin_mod(T, P, q16)
        t = time.time() - t
        y16.append(t)
        fm16.append(fmatch)

        t = time.time()
        match,fmatch = karp_rabin_mod(T, P, q32)
        t = time.time() - t
        y32.append(t)
        fm32.append(fmatch)

        t = time.time()
        match,fmatch = karp_rabin_mod(T, P, q64)
        t = time.time() - t
        y64.append(t)
        fm64.append(fmatch)

    plt.plot(x,y8,color='blue',label='8 bit')
    plt.plot(x,y16,color='red',label='16 bit')
    plt.plot(x,y32,color='green',label='32 bit')
    plt.plot(x,y64,color='magenta',label='64 bit')
    plt.title("running time")
    plt.legend(loc="upper left")
    plt.show()

    plt.plot(x,fm8,color='blue',label='8 bit')
    plt.plot(x,fm16,color='red',label='16 bit')
    plt.plot(x,fm32,color='green',label='32 bit')
    plt.plot(x,fm64,color='magenta',label='64 bit')
    plt.title("number of false matches")
    plt.legend(loc="upper left")
    plt.show()

##### CALLS TO TEST FUNCIONS #########

test1()
test2()
test4()
# test_krsum_worst_case()
test5_1()
test5_2()
test5_3()
test_krmod_primes()
