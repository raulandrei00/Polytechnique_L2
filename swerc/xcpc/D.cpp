#include<bits/stdc++.h>

using namespace std;
using ll = long long;

struct Rect {
    double x1 , y1, x2, y2;
    Rect () {
        cin >> x1 >> y1 >> x2 >> y2;
    }

    double area () {
        return (x2 - x1) * (y2 - y1);
    }

};

void solve () {
    int n; cin >> n;
    vector<Rect> r;
    for (int i = 0; i < n; i++) {
        r.push_back(Rect());
    }

    double ans = r[0].area();

    for (int i = 1; i < n; i++) {
        
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