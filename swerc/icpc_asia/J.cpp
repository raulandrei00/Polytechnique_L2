#include<bits/stdc++.h>
using namespace std;
using ll = long long;

struct Aint {
    vector<ll> aint, lazy;
    int n, offset;

    Aint (int _n) : n(_n) {
        offset = 1;
        while (offset < n) offset <<= 1;
        aint.resize(2*offset);
        lazy.resize(2*offset);
        
    }

    void update (int pos , int val) {
        upd (1, 1, offset, pos, pos, val);
    }
    void update (int l , int r , int val) 
    {
        upd(1, 1, offset, l, r, val);
    }

    ll query (int l , int r) {
        return qry (1,1,offset,l,r);
    }

private:

    ll qry (int nod , int l, int r, int ql, int qr) {
        push_lazy(nod,l,r);
        if (ql <= l && r <= qr) { return aint[nod]; }
        else if (l > qr || r < ql) return 0;
        else {
            int f1 = 2*nod , f2 = 2*nod+1, m = (l+r)/2;
            return qry (f1, l, m, ql, qr) + 
                qry (f2, m + 1, r, ql , qr);
        }
    }

    void upd (int nod , int l , int r, int ul , int ur, int val) {
        if (ul <= l && r <= ur) {
            lazy[nod] += val;
            push_lazy(nod, l , r);
        }
        else if (l > ur || ul > r) { return; }
        else {

            push_lazy(nod, l, r);
            int f1 = 2*nod , f2 = 2*nod+1, m = (l+r)/2;

            upd(f1, l, m, ul, ur, val);
            upd(f2, m+1, r, ul, ur, val);
            aint[nod] = aint[f1] + aint[f2];
        }
    }

    void push_lazy (int nod, int l, int r) {
        int f1 = 2*nod , f2 = 2*nod+1;
        if (f1 < 2*offset) {
            lazy[f1] += lazy[nod];
            lazy[f2] += lazy[nod];
        }
        aint[nod] += (r-l+1)*lazy[nod];
        lazy[nod] = 0;
    }
};

int main () {
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    int n;
    cin >> n;

    vector<int> bari(n + 1), celula(n + 1);
    for (int i = 1; i <= n; ++i)
        cin >> celula[i];
    for (int i = 1; i <= n - 1; ++i)
        cin >> bari[i];

    struct Event {
        char tip; // b, c
        int h, col;

        bool operator < (const Event &other) const {
            return h > other.h;
        }
    };

    vector<Event> events;
    // events.reserve(2*n+1);
    for (int i = 1; i <= n; ++i) {
        if (i < n)
            events.push_back({'b', bari[i], i});
        events.push_back({'c', celula[i], i});
    }
    sort(events.begin(), events.end());

    Aint raspFinal(n), coloanePornite(n);

    set<int> coloaneBari; // (i, j]
    coloaneBari.insert(n);
    coloaneBari.insert(0);

    for (auto &[tip, h, col] : events) {
        // cout << "muie metehau " << tip << ' ' << h << ' ' << col << endl;
        if (tip == 'b') {
            auto it = coloaneBari.lower_bound(col);
            int dr = *it, st = *(prev(it));

            int countRight = coloanePornite.query(col + 1, dr),
                countLeft = coloanePornite.query(st + 1, col);
            
            pair<int, int> newLeft = {col - countLeft + 1, col},
                oldLeft = {dr - countLeft - countRight + 1, dr - countRight};

            raspFinal.update(oldLeft.first, oldLeft.second, -h);
            raspFinal.update(newLeft.first, newLeft.second, h);

            // cout << "mete a adaugat " << oldLeft.first << ' ' << oldLeft.second << ' ' << -h << endl;
            // cout << "mete a adaugat " << newLeft.first << ' ' << newLeft.second << ' ' << +h << endl;

            coloaneBari.insert(col);
        }
        else { // 'c'
            auto it = coloaneBari.lower_bound(col);
            int dr = *it, st = *(prev(it));

            coloanePornite.update(col, 1);
            int countInterval = coloanePornite.query(st + 1, dr);
            int pozMeu = dr - countInterval + 1;

            // cout << "metehau se afla " << col << " (" << st << ' ' << dr << "] " << ' ' << pozMeu << endl;

            raspFinal.update(pozMeu, h);

            // cout << "mete a adaugat " << pozMeu << ' ' << h << endl;
        }
    }
    
    for (int i = 1; i <= n; ++i)
        cout << raspFinal.query(i, i) << ' ';
    cout << '\n';

    return 0;
}