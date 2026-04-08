#include <iostream>
#include <string>

using namespace std;

int main () {
    for (char x = 0; x < 127; x++) {
        cout << x << " " << (int)(x & 0xf) << endl;
    }
}