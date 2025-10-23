#include<bits/stdc++.h>

using namespace std;
using ll = long long;

#define rep(i, a, b) for(int i = a; i < (b); ++i)
#define all(x) begin(x), end(x)
#define sz(x) (int)(x).size()
typedef long long ll;
typedef pair<int, int> pii;
typedef vector<int> vi;

vector<int> eulerWalk(vector<vector<pair<int , pair<string , int>> >>& gr, int nedges, int src=0) {
	int n = sz(gr);
	vi D(n), its(n), ret, s = {src};
    map<pair<string , int> , bool> eu;

    vector<string> rett;

	D[src]++; // to allow Euler paths, not just cycles
	while (!s.empty()) {
		int x = s.back(), y, &it = its[x], end = sz(gr[x]);
        pair<string , int> e;
		if (it == end){ ret.push_back(x); rett.push_back(e.first); s.pop_back(); continue; }
		tie(y, e) = gr[x][it++];
		if (!eu[e]) {
			D[x]--, D[y]++;
			eu[e] = 1; s.push_back(y);
            // rett.push_back(e.first);
            // cerr << e.first << '\n';
		}}
    
	for (int x : D) if (x < 0 || sz(ret) != nedges+1) return vector<int>();
	return ret;
}

vi _eulerWalk(vector<vector<pii>>& gr, int nedges, int src=0) {
	int n = sz(gr);
	vi D(n), its(n), eu(nedges), ret, s = {src};
	D[src]++; // to allow Euler paths, not just cycles
	while (!s.empty()) {
		int x = s.back(), y, e, &it = its[x], end = sz(gr[x]);
		if (it == end){ ret.push_back(x); s.pop_back(); continue; }
		tie(y, e) = gr[x][it++];
		if (!eu[e]) {
			D[x]--, D[y]++;
			eu[e] = 1; s.push_back(y);
		}}
	for (int x : D) if (x < 0 || sz(ret) != nedges+1) return {};
	return {ret.rbegin(), ret.rend()};
}



void solve () {
    int n; cin >> n;
    vector< vector<pair<int , pair<string , int>> > > adj(27);
    vector<int> indeg(27,0) , outdeg(27,0);

    vector< vector< queue<string> > > pula_cal(26, vector<queue<string> > (26));


    for (int i = 0; i < n; i++) {
        string s; cin >> s;
        adj[s.front()-'a'].push_back(make_pair(s.back()-'a' , make_pair(s + "." , i)));
        outdeg[s.front()-'a']++;
        indeg[s.back()-'a']++;
        
    }

    int src = 0;
    for (int i = 0; i < 27; i++) {
        if (indeg[i]+1 == outdeg[i]) src = i;
    }

    for (int i = 0; i < 26; i++) {
        sort(adj[i].begin() , adj[i].end() , [&](pair<int , pair<string , int>>  a , pair<int , pair<string , int>>  b) {
            if (a.second.first != b.second.first) return a.second.first < b.second.first;
            else return a.second.second < b.second.second;
        });
        for (auto to : adj[i]) {
            pula_cal[i][to.first].push(to.second.first);
            // cerr << i << "->" << to.first << ' ' << to.second.first << '\n';
        }
    }

    auto rez = eulerWalk(adj , n , src);
    reverse(rez.begin() , rez.end());

    vector<string> afis;
    for (int i = 0; i < (int)rez.size()-1; i++) {
        afis.push_back(pula_cal[rez[i]][rez[i+1]].front());
        // cerr << pula_cal[rez[i]][rez[i+1]].front() << '\n';
        pula_cal[rez[i]][rez[i+1]].pop();
        // cerr << rez[i] << ' ' << rez[i+1] << '\n';
    }
    
    if (rez.empty()) {
        cout << "***\n";
    }
    else {
        afis.back().pop_back();
        for (int i = 0; i < (int)afis.size(); i++) {
            cout << afis[i];
            // cerr << afis[i] << '\n';
            // if (i != (int)rez.size()-1) cout << ".";
        }
        cout << '\n';
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