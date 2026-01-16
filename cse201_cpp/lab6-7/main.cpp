#include"treemap.h"
#include<bits/stdc++.h>

using namespace std;

int main () {
    

    treemap_t<int , int> x;
    x.set_at (5, 55);
    // cerr << "??";
    x.set_at (19, 4);

    cout << x.at(19) << '\n';

    x.display();

    treemap_t<lanister_t, account_t> Map;
    Map["Tyrion"] = 2;
    Map["Jaime"] = 15;
    Map["Cersei"] = 63;
    Map["Tywin"] = 75;
    Map["Kevan"] = 48;
    Map["Lancel"] = 70;
    Map["Alton"] = 54;
    Map["Martyn"] = 32;
    Map["Willem"] = 6;
    
    std::cout << Map.at(*new lanister_t("Kevan")) << std::endl;
    Map.display();
    for(auto it = Map.begin();
      it.cur != Map.end();
      ++it) {
        std::cout << it.cur->key << " => " << it.cur->value << std::endl;
    }


    
    // In order to finally make the expansion of for (auto &x : Map) to work
    // I added 1 more operator (->) and fixed a pointer initialisation bug
    // in order for it to work without refference I have to implement a copy constructor.
    for (auto [k,v] : Map) {
        // cerr << "????";
        cout << k << ' ' << v << '\n';  
        // cout << X.key << ' ' << X.value << '\n';
    }

    account_t a = 68;
    a.note = "hehe";

    cout << a;

}