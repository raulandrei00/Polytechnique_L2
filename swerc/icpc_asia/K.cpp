#include<bits/stdc++.h>
using namespace std;
using ll = long long;

const int INF = 1e6;
const int MAX_N = 1000;
char mat[MAX_N][MAX_N];
int frecv[INF + 1];
int n, m;

const int DIR = 8;
const int dl[DIR] = {0, 1, 0, -1, -1, -1, 1, 1};
const int dc[DIR] = {1, 0, -1, 0, -1, 1, -1, 1};

bool inmat(int l, int c) {
    if (l < 0 || l >= n)
        return false;
    if (c < 0 || c >= m)
        return false;
    return true;
}

void eval(vector<int> &v) {
    long long sum = 0, prod = 1, num = 0;
    if (v.empty())
        return;
    if (!isdigit(v[0]))
        return;

    bool lastSign = false;
    for (char ch: v) {
        if (isdigit(ch))
            num = num * 10 + ch - '0';
        else if (ch == '*') {
            prod *= num;
            num = 0;
        } else {
            prod *= num;
            sum += prod;
            prod = 1;
            num = 0;
        }

        if (!isdigit(ch)) {
            if (lastSign)
                break;
            lastSign = true;
        } else
            lastSign = false;

        if (num > INF)
            break;
        if (prod * num > INF)
            break;
        if (sum + prod * num > INF)
            break;

        if (isdigit(ch)) {
            frecv[sum + prod * num]++;
            //printf("%d ", sum + prod * num);
        }
    }
    //printf("\n");
}

int main () {
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    int q;
    cin >> n >> m >> q;

    for (int l = 0; l < n; l++) {
        for (int c = 0; c < m; c++) 
            cin >> mat[l][c];
    }

    for (int l = 0; l < n; l++) {
        for (int c = 0; c < m; c++) {
            if (!isdigit(mat[l][c]))
                continue;
            for (int d = 0; d < DIR; d++) {
                vector<int> v;
                int x = 0;
                while (inmat(l + x * dl[d], c + x * dc[d])) {
                    v.push_back(mat[l + x * dl[d]][c + x * dc[d]]);
                    x++;
                }
                eval(v);
            }
        }
    }
    
    for (int l = 0; l < n; l++) {
        for (int c = 0; c < m; c++) {
            if (isdigit(mat[l][c]))
                frecv[mat[l][c] - '0'] -= 7;
        }
    }

    while (q--) {
        int a;
        cin >> a;
        cout << frecv[a] << "\n";
    }

    return 0;
}