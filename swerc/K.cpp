#include<bits/stdc++.h>
using ll = long long;
using namespace std;
const int NMAX = 3e5;
ll ans[NMAX+1], a[NMAX+1];

struct Aib {
    vector<ll> aib; int n;
    Aib (int _n) : n(_n) {
        aib.resize(n+1 , 0);
    }
    void update (int pos , ll val) {
        for (int i = pos; i > 0; i -= (i & -i)) {
            aib[i] += val;
        }
    }
    ll query (int pos) {
        ll ret = 0;
        for (int i = pos; i <= n; i += (i & -i) ){ 
            ret += aib[i];
        }
        return ret;
    }
};

vector<int> rights[NMAX+1]; // [ind]

int main () {

    #ifdef LOCAL
    freopen("swerc/input.txt" , "r" , stdin);
    #endif
    ll n, q, d; cin >> n >> q >> d;
    for (int i = 1; i <= n; i++) { cin >> a[i]; }
    ll crt_ans = d;
    queue<int> optimum_switch;
    for (int i = 1; i <= n; i++) {


        if (min(a[i]-1 , crt_ans) > crt_ans - a[i]) {
            optimum_switch.push(i);
        }

        crt_ans = max(crt_ans - a[i] , min(a[i]-1 , crt_ans));
        ans[i] = crt_ans;
        cerr << crt_ans << ' ';

    }
    cerr << '\n';

    optimum_switch.push(n+1);

    struct Query {
        int l, r, ind;
        int ans;
    };

    vector< Query > queries(q+1);

    for (int i = 1; i <= q; i++) {
        cin >> queries[i].l >> queries[i].r;
        queries[i].ind = i;
        rights[queries[i].l].push_back(i);
    }
    Aib aib(n);
    auto delta_pos = [&] (int i) {
        ll crt_val = ans[i-1] + aib.query(i-1);
        
        return (crt_val - a[i] - min(a[i]-1 , crt_val));
    };
    for (int l = 1; l <= n; l++) {
        for (auto ind : rights[l]) {
            queries[ind].ans = ans[queries[ind].r] + aib.query(queries[ind].r);
        }
        for (int i = l; i <= n; i++) {
            cerr << ans[i] + aib.query(i) << ' ';
        } cerr << '\n';
        int minEq_right = optimum_switch.front();
        if (minEq_right > l) {
            aib.update(minEq_right-1 , a[l]);
        }
        else {
            optimum_switch.pop();
            aib.update(optimum_switch.front()-1 , d - a[l]);
        }
        while (optimum_switch.front() < n+1 && delta_pos(optimum_switch.front()) >= 0) {
            int pos = optimum_switch.front();
            ll delta = delta_pos(pos);
            optimum_switch.pop();
            aib.update(optimum_switch.front() - 1 , delta);
        }
    }

    for (int i = 1; i <= q; i++) {
        cout << queries[i].ans << '\n';
    }

}