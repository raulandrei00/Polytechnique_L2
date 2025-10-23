#include<bits/stdc++.h>

using namespace std;
using ll = long long;
const int NMAX = 1e5 , SMAX = 1e5;
const int KMAX = 5e4;

int sz[NMAX+1];
vector<pair<int , int> > adj[NMAX+1];

unordered_map<int , int> repr[NMAX+1];
int n, m, k; 
int ans[NMAX+1];

void dfs (int nod , int par, int index = 0) {


    for (auto [key , val] : repr[nod]) {
        if (val > 0 && val < sz[key]) ans[index]++;
    }

    for (auto [to , edge_id] : adj[nod]) {
        if (to == par) continue;
        dfs(to , nod, edge_id);
        if (repr[to].size() > repr[nod].size()) swap(repr[to] , repr[nod]) , ans[index] = ans[edge_id];
        for (auto [key , val] : repr[to]) {
            if (val > 0) {
                if (repr[nod][key] == 0 && val < sz[key]) ans[index]++;
                else if (repr[nod][key] != 0 && repr[nod][key] + val == sz[key]) ans[index]--;
                repr[nod][key] += val;
            }
        }
    }

    // if (par != 0) {
    //     for (auto [key , val] : repr[nod]) {
    //         if (val != 0 && val < sz[key]) ans[index]++;
    //         // else if (val == 0 || val == sz[key])  
    //     }
    // }

}

void solve () {
    cin >> n >> m >> k;
    for (int i = 1; i < n; i++) {
        int x , y; cin >> x >> y;
        adj[x].push_back({y,i});
        adj[y].push_back({x,i});
    }
    for (int i = 1; i <= m; i++) {
        cin >> sz[i];
        for (int j = 1; j <= sz[i]; j++) {
            int nod; cin >> nod;
            repr[nod][i] = 1;
        }
    }
    dfs(1 , 0);
    int rez = 0;
    for (int i = 1; i < n; i++) {
        if (ans[i] >= k) rez++;
    }
    cout << rez << '\n';
    for (int i = 1; i < n; i++) {
        if (ans[i] >= k) cout << i << ' ';
    }
    if (rez) cout << '\n';
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