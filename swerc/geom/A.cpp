#include <bits/stdc++.h>
using namespace std;

struct Point {
    double x, y;
    Point (double _x, double _y) : x(_x) , y(_y) {}
};

struct Vec : Point {
    
    Vec (double _x, double _y) : Point (_x,_y) {}

    double norm () {
        return sqrt (x*x + y*y);
    }
    Vec normalise () {
        return Vec (x / norm() , y / norm());
    }

    Vec friend operator + ( const Vec& v1 , const Vec& v2 ) {
        Vec ret (v1.x + v2.x , v1.y + v2.y);
        return ret;
    }
    Vec operator - () {
        return Vec (-x , -y);
    }

    Vec friend operator - ( const Vec& v1 , const Vec& v2 ) {
        Vec ret (v1.x - v2.x , v1.y - v2.y);
        return ret;
    }

};

struct Line {
    double x0, y0, x1, y1;
    Line (Vec v1, Vec v2) {
        x0 = v1.x, y0 = v1.y;
        x1 = v2.x, y1 = v2.y;
    }

    double dist (Point p) {
        
    }

};

int main () {
    ios_base::sync_with_stdio(0); cin.tie(0);
    

    return 0;
}