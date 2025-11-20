#include <bits/stdc++.h>

using namespace std;

int solve(string s, int n, int m, int k) {
    int initDist(0);
    vector<bool> distinct(n - 1);
    for (int i = 0; i < n - 1; ++i)
        distinct[i] = (s[i] != s[i + 1]), initDist += distinct[i];
    
    vector<vector<int>> distanteDist(k);
    for (int start = 0; start < k; ++start) {
        int last(-1);
        for (int j = start; j < n - 1; j += k) {
            if (!distinct[j]) {
                // cout << start << ' ' << j << ' ' << last << '\n';
                if (last != -1)
                    distanteDist[start].push_back((j - last) / k);
                last = j;
            }
        }
    }

    // for (auto vec : distanteDist) {
    //     for (int val : vec) 
    //         cout << val << ' ';
    //     cout << '\n';
    // }

    vector<vector<int>> ans(2, vector<int>(m + 1));
    for (auto vec : distanteDist) {
        for (int val : vec) {
            vector<int> luatNou(m + 1);
            for (int i = val; i <= m; ++i)
                luatNou[i] = ans[0][i - val] + 1;
            for (int i = 0; i <= m; ++i) {
                ans[0][i] = max(ans[0][i], ans[1][i]);
                ans[1][i] = luatNou[i];
            }
        }
        for (int i = 0; i <= m; ++i) {
            ans[0][i] = max(ans[0][i], ans[1][i]);
            ans[1][i] = 0;
        }
    }

    int maxTaken(0);
    for (int i = 0; i <= m; ++i)
        maxTaken = max(ans[0][i], maxTaken);
    return 2 * maxTaken + initDist + 1;
}

int main() {
    int n, m, k;
    cin >> n >> m >> k;

    string s;
    cin >> s;

    int ans(0);
    for (int i = 0; i < 2; ++i) {
        for (int p = 0; p < k; ++p) 
            s[p] = 'R' + 'B' - s[p];
        for (int j = 0; j < 2; ++j) {
            for (int p = 0; p < k; ++p) 
                s[n - 1 - p] = 'R' + 'B' - s[n - 1 - p];
            if (m - (!i) - (!j) >= 0)
                ans = max(ans, solve(s, n, m - (!i) - (!j), k));
        }
    }
    cout << ans;
}