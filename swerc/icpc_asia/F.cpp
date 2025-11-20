#include <bits/stdc++.h>

using namespace std;

int main() {
    int n;
    cin >> n;

    vector<int> a(n);
    for (int i = 0; i < n; ++i)
        cin >> a[i];

    vector<int> gcdSt(a);
    for (int i = 1; i < n; ++i)
        gcdSt[i] = __gcd(gcdSt[i], gcdSt[i - 1]);
    vector<int> gcdDr(a);
    for (int i = n - 2; i >= 0; --i)
        gcdDr[i] = __gcd(gcdDr[i], gcdDr[i + 1]);
    
    long long ans(0);
    for (int i = 0; i < n; ++i)
        ans += min(gcdSt[i], gcdDr[i]);
    cout << ans - gcdSt[n - 1];
}