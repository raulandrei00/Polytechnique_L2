import random
import time
import math
from matplotlib import pyplot as plt

from WG import *

# txt = """0	1528	1497	1062	1968	1498	1757	1469	1471	2230	2391	1137	 504	725	3006	1054	831	1353	856	2813	1745	2276	1347	1862
# 1528	0	999	1372	447	316	1327	2145	1229	809	976	1688	2026	885	1710	773	1445	738	721	1797	329	1620	489	826
# 1497	999	0	651	1293	689	354	1315	254	1735	1204	929	1867	840	1607	501	876	280	1181	1319	1318	810	523	516
# 1062	1372	651	0	1769	1131	766	773	489	2178	1836	318	1314	696	2253	601	261	721	1171	1903	1697	1280	914	1159
# 1968	447	1293	1769	0	639	1571	2534	1544	445	744	2088	2469	1331	1497	1186	1869	1076	1137	1740	296	1742	855	946
# 1498	316	689	1131	639	0	1011	1894	927	1064	894	1450	1975	788	1565	563	1247	443	811	1556	629	1316	216	545
# 1757	1327	354	766	1571	1011	0	1238	287	2017	1326	955	2071	1157	1558	838	1025	633	1529	1143	1635	521	868	667
# 1469	2145	1315	773	2534	1894	1238	0	1073	2950	2513	462	1449	1413	2792	1374	776	1465	1882	2314	2471	1626	1680	1823
# 1471	1229	254	489	1544	927	287	1073	0	1983	1440	720	1785	900	1779	610	744	492	1307	1414	1554	809	742	750
# 2230	809	1735	2178	445	1064	2017	2950	1983	0	1052	2496	2734	1669	1753	1582	2253	1507	1373	2099	502	2171	1273	1386
# 2391	976	1204	1836	744	894	1326	2513	1440	1052	0	2131	2859	1672	756	1391	2022	1138	1673	1051	1020	1265	1052	690
# 1137	1688	929	318	2088	1450	955	462	720	2496	2131	0	1263	957	2498	916	340	1034	1431	2093	2012	1431	1233	1445
# 504	2026	1867	1314	2469	1975	2071	1449	1785	2734	2859	1263	0	1187	3437	1484	1053	1773	1360	3183	2250	2591	1807	2288
# 725	885	840	696	1331	788	1157	1413	900	1669	1672	957	1187	0	2283	348	641	646	476	2122	1166	1650	623	1143
# 3006	1710	1607	2253	1497	1565	1558	2792	1779	1753	756	2498	3437	2283	0	1957	2484	1664	2374	632	1777	1227	1669	1149
# 1054	773	501	601	1186	563	838	1374	610	1582	1391	916	1484	348	1957	0	685	300	698	1773	1096	1311	354	809
# 831	1445	876	261	1869	1247	1025	776	744	2253	2022	340	1053	641	2484	685	0	885	1105	2157	1758	1541	1033	1365
# 1353	738	280	721	1076	443	633	1465	492	1507	1138	1034	1773	646	1664	300	885	0	922	1476	1064	1052	250	514
# 856	721	1181	1171	1137	811	1529	1882	1307	1373	1673	1431	1360	476	2374	698	1105	922	0	2339	894	1974	763	1316
# 2813	1797	1319	1903	1740	1556	1143	2314	1414	2099	1051	2093	3183	2122	632	1773	2157	1476	2339	0	1969	688	1577	1023
# 1745	329	1318	1697	296	629	1635	2471	1554	502	1020	2012	2250	1166	1777	1096	1758	1064	894	1969	0	1884	817	1076
# 2276	1620	810	1280	1742	1316	521	1626	809	2171	1265	1431	2591	1650	1227	1311	1541	1052	1974	688	1884	0	1241	808
# 1347	489	523	914	855	216	868	1680	742	1273	1052	1233	1807	623	1669	354	1033	250	763	1577	817	1241	0	557
# 1862	826	516	1159	946	545	667	1823	750	1386	690	1445	2288	1143	1149	809	1365	514	1316	1023	1076	808	557	0"""

# distances = [x.strip().split() for x in txt.split('\n')]

# cities = T = ['Moscow', 'Saint Petersburg', 'Stockholm', 'Copenhagen', 'Hamburg', 'Berlin', 'Prague', 'Vienna', 'Budapest', 'Belgrade',
#               'Sofia', 'Bucharest', 'Istanbul', 'Madrid', 'Barcelona', 'Rome', 'Milan', 'Munich', 'Paris', 'Brussels', 'London', 'Dublin', 'Kyiv']
# list_edges = []
# for j in range(0, len(cities) - 1):
#     for i in range(j):
#         list_edges.append([cities[i], cities[j], int(distances[i][j])])

# print(list_edges)

# print(distances)

############
## Colors ##
############

Black = "\033[0m"
Red = "\033[31m"
Green = "\033[32m"
Yellow = "\033[33m"
Blue = "\033[34m"

#################
## Auxiliaries ##
#################


def dist(p1, p2):
    return math.sqrt((p1[0] - p2[0]) ** 2 + ((p1[1] - p2[1]) ** 2))


def dist_int(p1, p2):
    return int(dist(p1, p2))


def read_cities():
    cities = ["Barcelona", "Belgrade", "Berlin", "Brussels", "Bucharest", "Budapest", "Copenhagen", "Dublin", "Hamburg", "Istanbul", "Kyiv",
              "London", "Madrid", "Milan", "Moscow", "Munich", "Paris", "Prague", "Rome", "Saint Petersburg", "Sofia", "Stockholm", "Vienna", "Warsaw"]
    distances = []
    with open("cities.txt") as f:
        content = f.readlines()
        distances = [x.strip().split() for x in content]
    list_edges = []
    for j in range(0, len(cities) - 1):
        for i in range(j):
            list_edges.append([cities[i], cities[j], int(distances[i][j])])
    print(list_edges)
    return WG(list_edges)


def read_tsp_instance(instance_name):
    cities = []
    pos = []
    with open(instance_name + '.txt') as f:
        lines = f.readlines()
        for l in lines:
            node = l.strip().split()
            cities.append(int(node[0]))
            pos.append((int(node[1]), int(node[2])))
    list_edges = []
    for i in range(0, len(cities) - 1):
        for j in range(i + 1, len(cities)):
            list_edges.append([cities[i], cities[j], dist(pos[i], pos[j])])
    return (WG(list_edges), pos)


def check_edges(edges1, edges2):
    if len(edges1) != len(edges2):
        print(Red + '    Failure!' + Black + ' Additional or missing edges.')
        return False

    for e in edges2:
        if not (e[0], e[1]) in edges1 and not (e[1], e[0]) in edges1:
            print(Red + '    Failure!' + Black + ' The edge ', e,
                  ' should not be part of the selected edges.')
            return False

    print(Green + '    Success!' + Black)
    return True


def tutorial_instance():
    N = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
    P = [(0, 0), (0, 2), (0, 4), (1.5, 5.5), (3, 4), (3, 2), (3, 0)]
    L = []
    for i in range(len(N)):
        for j in range(i + 1, len(N)):
            L.append([N[i], N[j], dist_int(P[i], P[j])])

    return WG(L)

###########
## Tests ##
###########


def test1():
    print('Testing' + Blue + ' greedily_select_edges' + Black + ':')
    wg = tutorial_instance()
    S = {('d', 'e'), ('b', 'c'), ('a', 'g'), ('a', 'b'),
         ('c', 'd'), ('f', 'g'), ('e', 'f')}
    R = wg.greedily_select_edges()
    if (R is None):
        print(Yellow + '  Skipping.' + Black + ' Not implemented.')
        return

    print('  Instance: Tutorial example')
    check_edges(S, R)

    wg = read_cities()
    S = {('Moscow', 'Saint Petersburg'), ('Prague', 'Vienna'), ('Brussels', 'Paris'), ('Barcelona', 'Rome'), ('Bucharest', 'Istanbul'), ('Berlin', 'Prague'), ('Milan', 'Munich'), ('Barcelona', 'Madrid'), ('Brussels', 'London'), ('Kyiv', 'Moscow'), ('Saint Petersburg', 'Stockholm'),
         ('Berlin', 'Hamburg'), ('Copenhagen', 'Hamburg'), ('Dublin', 'London'), ('Copenhagen', 'Stockholm'), ('Bucharest', 'Sofia'), ('Belgrade', 'Budapest'), ('Belgrade', 'Sofia'), ('Munich', 'Paris'), ('Dublin', 'Kyiv'), ('Budapest', 'Vienna'), ('Istanbul', 'Madrid'), ('Milan', 'Rome')}
    R = wg.greedily_select_edges()

    print('  Instance: European cities')
    check_edges(S, R)


def test2():
    print('\nTesting' + Blue + ' build_cycle_from_edges' + Black + '.')
    wg = tutorial_instance()
    R = wg.greedy_min()
    if (R is None):
        print(Yellow + '  Skipping.' + Black + ' Not implemented.')
        return

    (w, T) = R
    print('  Instance: Tutorial example')
    if w == 15:
        print(Green + '    Success!' + Black)
    else:
        print(Red + '    Failure!' + Black + ' Your tour: ', (w, T))
        print("    Expected: (15, ['d', 'e', 'f', 'g', 'a', 'b', 'c'])")
        return

    wg = read_cities()
    (w, T) = wg.greedy_min()
    print('  Instance: European cities')
    if w == 14427:
        print(Green + '    Success!' + Black)
    else:
        print(Red + '    Failure!' + Black + ' Your tour: ', (w, T))
        print("    Expected: (14427, ['Moscow', 'Saint Petersburg', 'Stockholm', 'Copenhagen', 'Hamburg', 'Berlin', 'Prague', 'Vienna', 'Budapest', 'Belgrade', 'Sofia', 'Bucharest', 'Istanbul', 'Madrid', 'Barcelona', 'Rome', 'Milan', 'Munich', 'Paris', 'Brussels', 'London', 'Dublin', 'Kyiv'])")


def test3():
    print('\nTesting' + Blue + ' evaluate_flip' + Black + '.')
    wg = tutorial_instance()
    T = ['a', 'b', 'e', 'd', 'c', 'f', 'g']
    g = wg.evaluate_flip(T, 2, 4)
    if (g is None):
        print(Yellow + '  Skipping.' + Black + ' Not implemented.')
        return

    print('  Instance: Tutorial example')
    print('   Using cycle ' + Yellow + str(T) + Black + '.')
    print('   Flipping ' + Yellow + '(2, 4)' + Black + '.')
    if g == 2:
        print(Green + '    Success!' + Black)
    else:
        print(Red + '    Failure!' + Black + ' Obtained' + Yellow, g,
              Black + 'but expected ' + Yellow + '2' + Black + '.')
        return

    print('   Flipping ' + Yellow + '(2, 5)' + Black)
    g = wg.evaluate_flip(T, 2, 5)
    if g == -2:
        print(Green + '    Success!' + Black)
    else:
        print(Red + '    Failure!' + Black + ' Obtained' + Yellow, g,
              Black + 'but expected ' + Yellow + '-2' + Black + '.')
        return

    print('   Flipping ' + Yellow + '(3, 4)' + Black)
    g = wg.evaluate_flip(T, 3, 4)
    if g == -1:
        print(Green + '    Success!' + Black)
    else:
        print(Red + '    Failure!' + Black + ' Obtained' + Yellow, g,
              Black + 'but expected ' + Yellow + '-1' + Black + '.')


def test4():
    print('\nTesting ' + Blue + 'find_best_opt2' + Black + '.')

    wg = tutorial_instance()
    T = ['a', 'b', 'e', 'd', 'c', 'f', 'g']
    R = wg.find_best_opt2(T)
    if (R is None):
        print(Yellow + '  Skipping.' + Black + ' Not implemented.')
        return

    print('  Instance: Tutorial example')
    print('   Using cycle ' + Yellow + str(T) + Black + '.')
    (flip, g) = R
    if g == 2:
        print(Green + '    Success!' + Black)
    else:
        print(Red + '    Failure!' + Black + ' Obtained' + Yellow, (flip, g), Black +
              'but expected a flip of ' + Yellow + '(2, 4)' + Black + ' gaining ' + Yellow + '2' + Black + '.')
        return

    print('  Instance: European cities')
    wg = read_cities()
    T = ['Moscow', 'Saint Petersburg', 'Stockholm', 'Copenhagen', 'Hamburg', 'Berlin', 'Prague', 'Vienna', 'Budapest', 'Belgrade',
         'Sofia', 'Bucharest', 'Istanbul', 'Madrid', 'Barcelona', 'Rome', 'Milan', 'Munich', 'Paris', 'Brussels', 'London', 'Dublin', 'Kyiv']
    print('   Using cycle ' + Yellow + str(T) + Black + '.')

    flip, g = wg.find_best_opt2(T)
    if g == 784:
        print(Green + '    Success!' + Black)
    else:
        print(Red + '    Failure!' + Black + ' Obtained' + Yellow, (flip, g), Black +
              'but expected a flip of ' + Yellow + '(13, 18)' + Black + ' gaining ' + Yellow + '2' + Black + '.')


def test5():
    print('\nTesting ' + Blue + 'opt_2' + Black + '.')
    wg = tutorial_instance()
    T = ['a', 'b', 'e', 'd', 'c', 'f', 'g']
    w = wg.eval_cycle(T)
    R = wg.opt_2(w, T)
    if (R is None):
        print(Yellow + '  Skipping.' + Black + ' Not implemented.')
        return

    (w, L) = R
    print('  Instance: Tutorial example')
    print('   Using cycle ' + Yellow + str(T) + Black + '.')
    if w == 15:
        print(Green + '    Success!' + Black)
    else:
        print(Red + '    Failure!' + Black + ' Obtained' + Yellow, (w, L), Black +
              'but expected  ' + Yellow + "(15, ['a', 'b', 'c', 'd', 'e', 'f', 'g'])" + Black + '.')
        return

    print('  Instance: European cities')
    wg = read_cities()
    T = ['Moscow', 'Saint Petersburg', 'Stockholm', 'Copenhagen', 'Hamburg', 'Berlin', 'Prague', 'Vienna', 'Budapest', 'Belgrade',
         'Sofia', 'Bucharest', 'Istanbul', 'Madrid', 'Barcelona', 'Rome', 'Milan', 'Munich', 'Paris', 'Brussels', 'London', 'Dublin', 'Kyiv']
    w = wg.eval_cycle(T)
    print('   Using cycle ' + Yellow + str(T) + Black + '.')

    (w, L) = wg.opt_2(w, T)
    if w == 13643:
        print(Green + '    Success!' + Black)
    else:
        print(Red + '    Failure!' + Black + ' Obtained' + Yellow, (w, L), Black + 'but expected  ' + Yellow +
              "(13643, ['Moscow', 'Saint Petersburg', 'Stockholm', 'Copenhagen', 'Hamburg', 'Berlin', 'Prague', 'Vienna', 'Budapest', 'Belgrade', 'Sofia', 'Bucharest', 'Istanbul', 'Munich', 'Milan', 'Rome', 'Barcelona', 'Madrid', 'Paris', 'Brussels', 'London', 'Dublin', 'Kyiv'])" + Black + '.')


def test6():
    print('\nTesting ' + Blue + 'neighborhood_search_opt2' + Black + '.')
    wg = tutorial_instance()
    T = ['d', 'e', 'b', 'a', 'f', 'g', 'c']
    w = wg.eval_cycle(T)
    R = wg.neighborhood_search_opt2(w, T)
    if (R is None):
        print(Yellow + '  Skipping.' + Black + ' Not implemented.')
        return

    print('  Instance: Tutorial example')
    print('   Using cycle ' + Yellow + str(T) + Black + '.')
    (w, L) = R
    if w == 15:
        print(Green + '    Success!' + Black)
    else:
        print(Red + '    Failure!' + Black + ' Obtained' + Yellow, (w, L), Black +
              'but expected  ' + Yellow + "(15, ['d', 'e', 'f', 'g', 'a', 'b', 'c'])" + Black + '.')
        return

    print('  Instance: European cities')
    wg = read_cities()
    T = ['Moscow', 'Saint Petersburg', 'Stockholm', 'Copenhagen', 'Hamburg', 'Berlin', 'Prague', 'Vienna', 'Budapest', 'Belgrade',
         'Sofia', 'Bucharest', 'Istanbul', 'Madrid', 'Barcelona', 'Rome', 'Milan', 'Munich', 'Paris', 'Brussels', 'London', 'Dublin', 'Kyiv']
    w = wg.eval_cycle(T)
    print('   Using cycle ' + Yellow + str(T) + Black + '.')

    (w, L) = wg.neighborhood_search_opt2(w, T)
    if w == 11749:
        print(Green + '    Success!' + Black)
    else:
        print(Red + '    Failure!' + Black + ' Obtained' + Yellow, (w, L), Black + 'but expected  ' + Yellow +
              "(11749, ['Moscow', 'Saint Petersburg', 'Stockholm', 'Copenhagen', 'Hamburg', 'Berlin', 'Prague', 'Vienna', 'Budapest', 'Belgrade', 'Sofia', 'Bucharest', 'Istanbul', 'Munich', 'Milan', 'Rome', 'Barcelona', 'Madrid', 'Paris', 'Brussels', 'London', 'Dublin', 'Kyiv'])" + Black + '.')

###############
## Fun Stuff ##
###############

# Auxiliaries


def randomWG(n):
    L = []
    for i in range(n):
        for j in range(i + 1, n):
            L.append([i, j, random.random()])
    return WG(L)


def random_euclidian(n):
    r = 1000
    pos = [(random.randint(0, r), random.randint(0, r)) for _ in range(n)]

    L = []
    for i in range(n - 1):
        for j in range(i + 1, n):
            L.append([i, j, dist(pos[i], pos[j])])

    return WG(L)


def compare_approx():
    maxn = 50
    minn = 5
    numtrial = 5

    x = [n for n in range(minn, maxn)]

    yrand = []
    ygreedy = []
    yopt2r = []
    yopt2g = []

    trand = []
    tgreedy = []
    topt2r = []
    topt2g = []

    for n in x:
        wg = random_euclidian(n)

        start = time.process_time()
        s = wg.greedy_min()
        tgreedy.append(time.process_time() - start)
        ygreedy.append(s[0])

        start = time.process_time()
        s = wg.neighborhood_search_opt2(s[0], s[1])
        topt2g.append(time.process_time() - start)
        yopt2g.append(s[0])

        avgs = 0
        mins = math.inf

        avgr = 0
        minr = math.inf
        for _ in range(numtrial):

            start = time.process_time()
            (T, w) = wg.random_cycle()
            avgr += time.process_time() - start
            if w < minr:
                minr = w

            start = time.process_time()
            s = wg.neighborhood_search_opt2(w, T)
            avgs += time.process_time() - start
            if s[0] < mins:
                mins = s[0]
        topt2r.append(avgs / numtrial)
        yopt2r.append(mins)

        trand.append(avgr / numtrial)
        yrand.append(minr)

    plt.plot(x, yrand, color='red', label='rand')
    plt.plot(x, ygreedy, color='blue', label='greedy')
    plt.plot(x, yopt2g, color='magenta', label='greedy opt2')
    plt.plot(x, yopt2r, color='green', label='rand opt2')
    plt.legend(loc='upper left')
    plt.title('Comparison solution quality')
    plt.xlabel('instance size')
    plt.ylabel('average solution quality')
    plt.show()

    plt.plot(x, trand, color='red', label='rand')
    plt.plot(x, tgreedy, color='blue', label='greedy')
    plt.plot(x, topt2g, color='magenta', label='greedy opt2')
    plt.plot(x, topt2r, color='green', label='rand opt2')
    plt.legend(loc='upper left')
    plt.title('Comparison computational time')
    plt.xlabel('instance size')
    plt.ylabel('average time')
    plt.show()


def get_ordered_coordinates(T, pos):
    x = []
    y = []
    for t in T:
        p = pos[t - 1]
        x.append(p[0])
        y.append(p[1])
    x.append(x[0])
    y.append(y[0])
    return x, y

# Tests


def run_drill_instance():
    (wg, pos) = read_tsp_instance('a280')
    s = wg.greedy_min()
    (x, y) = get_ordered_coordinates(s[1], pos)
    plt.plot(x, y, color='blue', marker=".")
    plt.title('cost ' + str(s[0]))
    plt.show()

    s2 = wg.neighborhood_search_opt2(s[0], s[1])
    print(wg.eval_cycle(s2[1]))

    (x, y) = get_ordered_coordinates(s2[1], pos)
    plt.plot(x, y, color='red', marker=".")
    plt.title('cost ' + str(s2[0]))
    plt.show()

    print('min tree bound:', wg.weight_min_tree(list(wg.adj.keys())))


def run_us_instance():
    (wg, pos) = read_tsp_instance('att48')
    s = wg.greedy_min()
    (x, y) = get_ordered_coordinates(s[1], pos)
    plt.plot(x, y, color='blue', marker=".")
    plt.title('cost ' + str(s[0]))
    plt.show()

    s2 = wg.neighborhood_search_opt2(s[0], s[1])
    print(wg.eval_cycle(s2[1]))

    (x, y) = get_ordered_coordinates(s2[1], pos)
    plt.plot(x, y, color='red', marker=".")
    plt.title('cost ' + str(s2[0]))
    plt.show()

    print('min tree bound:', wg.weight_min_tree(list(wg.adj.keys())))


def run_eu_instance():
    wg = read_cities()
    s = wg.greedy_min()
    print('greedy ', s)
    print('2-opt greedy ', wg.neighborhood_search_opt2(s[0], s[1]))
    print('min tree bound', wg.weight_min_tree(list(wg.adj.keys())))

###############
## Run Tests ##
###############


print("Question 1")
test1()
print("\nQuestion 2")
test2()
print("\nQuestion 3")
test3()
print("\nQuestion 4")
test4()
print("\nQuestion 5")
test5()
print("\nQuestion 6")
test6()

# compare_approx()
# run_eu_instance()
# run_us_instance()
# run_drill_instance()
