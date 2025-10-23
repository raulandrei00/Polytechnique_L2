#include<bits/stdc++.h>

using namespace std;
using ll = long long;

struct Edge {
    int  b;
    int p, t;
};

void solve () {
    int n; cin >> n;
    int i , g , s; cin >> i >> g >> s;
    vector<int> total(n+1) , restr(n+1);

    vector<vector<Edge> > adj(n+1);
    
    vector<bool> med(n+1 , 0);
    
    int m; cin >> m;
    for (int i = 1; i <= m; i++) {
        int x; cin >> x;
        med[x] = 1;
    }
    int r; cin >> r;
    for (int i = 1; i <= r; i++) {  
        int a , b , p , t;
        cin >> a >> b >> p >> t;
        adj[a].push_back({b, p, t});
    }
}

int main () {

    #ifdef LOCAL 
        freopen("input.txt" , "r" , stdin);
    #endif

    ios_base::sync_with_stdio(0); cin.tie(0);

    int t; cin >> t;
    while (t--) { solve(); }

    return 0;
}