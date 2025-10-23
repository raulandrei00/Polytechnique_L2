#include<bits/stdc++.h>

using namespace std;
using ll = long long;

void solve () {
    
    int n, k; cin >> n >> k;

    vector<int> known(n) , make(k);

    for (int i = 0; i < n; i++) {
        cin >> known[i];
    }

    for (int i = 0; i < k; i++) {
        cin >> make[i];
    }

    vector<bool> canMake(360);
    canMake[0] = 1;
    for (int i = 0; i < n; i++) {
        for (int cnt = 1; cnt * known[i] % 360 != 0; cnt++) {
            for (int u = 0; u < 360; u++) {
                if (canMake[u]){

                    canMake[(u+known[i]*cnt) % 360] = 1;
                    canMake[(360 - (u+known[i]*cnt) % 360) % 360] = 1;
                }
            }
        }
    }

    for (int i = 0; i < k; i++) {
        if (canMake[make[i]]) cout << "YES\n";
        else cout << "NO\n";
    }
    
}

int main () {

    #ifdef LOCAL 
        freopen("input.txt" , "r" , stdin);
    #endif

    ios_base::sync_with_stdio(0); cin.tie(0);

    int t = 1;
    while (t--) { solve(); }

    return 0;
}