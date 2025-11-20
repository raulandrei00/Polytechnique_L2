#include<bits/stdc++.h>
using namespace std;
using ll = long long;

struct bus {
    int s, t;
};

struct person {
    int i, p;
};

const int MAX_N = 2e5;
double ans[MAX_N];
bus buses[MAX_N];
person people[MAX_N];

int main () {
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    int n, m, l, x, y;

    cin >> n >> m >> l >> x >> y;
    for (int i = 0; i < n; i++) 
        cin >> buses[i].s >> buses[i].t;
    for (int i = 0; i < m; i++) {
        cin >> people[i].p;
        people[i].i = i;
    }

    sort(people, people + m, [&x](person a, person b) {
        return a.p < b.p;
    });
    sort(buses, buses + n, [&x](bus a, bus b) {
        return a.s < b.s;
    });


    int i = 0;
    double minn = l;
    for (int j = 0; j < m; j++) {
        person q = people[j];
        while (i < n && buses[i].s <= q.p) {
            minn = min(minn, (double)(buses[i].t - buses[i].s) / x + (double)(l - buses[i].t) / y);
            i++;
        }
        ans[q.i] = min((double)(l - q.p) / y, minn);
    }

    cout << fixed << setprecision(8);
    for (int i = 0; i < m; i++)
        cout << ans[i] << "\n";

    return 0;
}