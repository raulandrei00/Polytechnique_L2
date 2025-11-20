#define _USE_MATH_DEFINES

#include<bits/stdc++.h>
#include<cmath>
#include<math.h>
using namespace std;
using ll = long long;
#define rep(i, a, b) for(int i = a; i <= (b); ++i)
#define all(x) x.begin(), x.end()
typedef pair<int , int> pii;
typedef vector<int> vi;

template <class T> int sgn (T x) { return (x > 0) - (x < 0); }
template <class T> 
struct Point {
    typedef Point P;
    T x, y;
    explicit Point (T x=0, T y=0) : x(x), y(y) {}
    bool operator < (P p) const {return tie(x,y) < tie(p.x,p.y);}
    bool operator == (P p) const {return tie(x,y) == tie(p.x,p.y);}
    P operator + (P p) const { return P(x+p.x, y+p.y); }
    P operator - (P p) const { return P(x-p.x, y-p.y); }
    P operator * (T d) const { return P(x*d, y*d); }
    P operator / (T d) const { return P(x/d, y/d); }
    T dot (P p) const { return x*p.x + y* p.y; }
    T cross (P p) const { return x*p.y - y*p.x; }
    T cross (P a, P b) const { return (a-*this).cross(b-*this); }
    T dist2 () const { return x*x + y*y; }
    double dist () const { return sqrt((double)dist2()); }
    double angle () const { return atan2(y,x); }
    P unit () const { return *this/dist(); }
    P perp () const { return P(-y, x); }
    P normal () const { return perp().unit(); }
    P rotate (double a) const {
        return P(x*cos(a) - y*sin(a), x*sin(a)+y*cos(a));
    }
    friend ostream& operator << (ostream& os, P p) {
        return os << "(" << p.x << ' ' << p.y << ")"; 
    }

};

template<class P>
double lineDist(const P& a, const P& b, const P& p) {
    return (double) (b - a).cross(p - a) / (b - a).dist();
}

typedef Point<ll> P;
vector<P> convexHull(vector<P> pts) {
    if (pts.size() <= 1)
        return pts;

    sort(pts.begin(), pts.end());
    vector<P> h(pts.size() + 1);
    int s = 0, t = 0;
    for (int it = 2; it--; s = --t, reverse(pts.begin(), pts.end()))
        for (P p : pts) {
            while (t >= s + 2 && h[t-2].cross(h[t - 1], p) <= 0) t--;
            h[t++] = p;
        }
    return {h.begin(), h.begin() + t - (t == 2 && h[0] == h[1])};
}

int main () {
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    int n, r;
    cin >> n >> r;

    P origin(0, 0);

    vector<P> input(n);
    for (P &p : input)
        cin >> p.x >> p.y;

    long double mind(r);
    vector<P> h = convexHull(input);
    for (int i = 0; i < h.size(); ++i) {
        int j = (i + 1) % h.size();
        long double d = lineDist(h[i], h[j], origin);
        mind = min(mind, d);
    }

    cout << fixed << setprecision(12);
    
    if (mind < 0) 
        return cout << (long double) r * r * M_PI / 2, 0;
    
    long double alpha = acos(mind / r);

    // cout << "mete are pasarica " << mind << " " << r << ' ' << alpha << endl;

    cout << (long double) r * r * alpha - r * sin(alpha) * mind;
    return 0;
}