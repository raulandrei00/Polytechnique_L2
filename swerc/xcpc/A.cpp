#include <bits/stdc++.h>
#include <math.h>

using namespace std;

const long double pi = M_PI;

int main() {
    int n, d, t;
    cin >> n >> d >> t;

    int h = 0;
    for (int i = 1; i < (n + 1) / 2; i++) {
        if (t >= n) {
            t -= n;
            h++;
        }
    }
    if (n % 2 == 0 && t == n / 2) {
        h++;
        t -= n / 2;
        cout << 0 << " " << d << "\n";
        return 0;
    }
    else if (n % 2 == 1 && h == (n-1)/2) {
        long double u = sqrt(((long double)2.0 * d * d) / (1.0 - cos(2.0 * pi * h / n)));
        cout << setprecision(25) << fixed << 0 << " " << u << '\n'; return 0;
    }

    long double u = sqrt(((long double)2.0 * d * d) / (1.0 - cos(2.0 * pi * h / n)));
    long double l = sqrt(((long double)2.0 * d * d) / (1.0 - cos(2.0 * pi * (h + 1) / n)));

    cout << setprecision(25) << fixed << l << " " << u << "\n";
}

