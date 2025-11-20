#include<bits/stdc++.h>
using namespace std;
using ll = long long;

void solve () {
    int n, j, k; cin >> n >> j >> k;
    vector<int> p = {1,2,};
    if (n > 100) p.push_back(3);
    if (n > 1000) p.push_back(4);

    auto p2 = p;

    for (int i = 1; i < j; i++) {
        next_permutation(p.begin() , p.end());
    }
    for (int i = 1; i < k; i++) {
        next_permutation(p2.begin() , p2.end());
    }

    // cerr << p[0] << ' ' << p[1] << '\n';
    // cerr << p2[0] << ' ' << p2[1] << '\n';

    int a = 0;

    for (int i = 0; i < p.size(); i++) {
        if (p[i] == p2[i]) a++;
    }

    cout << a << "A" << p.size()-a << "B" << '\n';

}

int main () {
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    int t; cin >> t;
    while (t--) { solve(); }

    return 0;
}