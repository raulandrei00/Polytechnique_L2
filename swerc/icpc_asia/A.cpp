#include<bits/stdc++.h>

using namespace std;

int main () {

    vector<int> v(3);
    cin >> v[1] >> v[2] >> v[0];

    sort(v.begin() , v.end());
    if (v[2] - v[0] >= 10) {
        cout << "check again\n";
    }
    else {
        cout << "final " << v[1] << '\n';
    }

    return 0;
}