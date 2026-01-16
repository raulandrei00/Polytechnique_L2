#include<bits/stdc++.h>

using namespace std;

struct monster_t {
    string name;
    int health;
    
    monster_t () : name{""}, health{} {}
    monster_t (string n) : name{n}, health{} {}
    monster_t (string n, int h) : name{n}, health{h} {}
    
    
};

std::ostream& operator << (std::ostream& os, const monster_t& m) {
    return os << m.name << ": " << m.health << " HP";
}
int main () {

    monster_t Pika("Pikachu");
    Pika.health = 43;

    cout << Pika << '\n';

    vector<monster_t> army;

    for (int i = 0; i < 10; i++) {
        army.push_back(* new monster_t("Pikachu" + to_string(i)));
    }

    for (auto &boss : army) cout << boss << '\n';

}