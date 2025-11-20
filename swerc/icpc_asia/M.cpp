#include<bits/stdc++.h>
using namespace std;
using ll = long long;

const int MAX_N = 2e5;
int dist[MAX_N + 1], a[MAX_N + 1], maxx[MAX_N + 1];
vector<int> adj[MAX_N + 1];

int main () {
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    int n, m, k;

    cin >> n >> m >> k;
    for (int v = 1; v <= n; v++) {
        cin >> a[v];
        dist[v] = n + 1;
    }

    for (int e = 0; e < m; e++) {
        int u, v;
        cin >> u >> v;
        adj[u].push_back(v);
        adj[v].push_back(u);
    }

    queue<int> q;
    q.push(1);
    dist[1] = 0;
    while (!q.empty()) {
        int u = q.front();
        q.pop();

        for (int v : adj[u]) {
            if (dist[u] + 1 < dist[v]) {
                dist[v] = dist[u] + 1;
                q.push(v);
            }
        }
    }

    for (int i = 1; i <= n; i++)
        maxx[a[i]] = max(maxx[a[i]], dist[i]);

    for (int i = 1; i <= k; i++)
        cout << maxx[i] << " ";
    cout << "\n";
    
    return 0;
}