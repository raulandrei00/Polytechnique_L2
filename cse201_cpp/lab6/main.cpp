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

    treemap_t<string , double> Map;
    Map.set_at("Tyrion", 2);
    Map.set_at("Jaime", 15);
    Map.set_at("Cersei", 63);
    Map.set_at("Tywin", 75);
    Map.set_at("Kevan", 48);
    Map.set_at("Lancel", 70);
    Map.set_at("Alton", 54);
    Map.set_at("Martyn", 32);
    Map.set_at("Willem", 6);
    
    std::cout << Map.at("Kevan") << std::endl;
    Map.display();
    for(treemap_t<std::string, double>::iterator_t it = Map.begin();
      it.cur != Map.end();
      ++it) {
        std::cout << it.cur->key << " => " << it.cur->value << std::endl;
    }


    
    // In order to finally make the expansion of for (auto &x : Map) to work
    // I added 1 more operator (->) and fixed a pointer initialisation bug
    // in order for it to work without refference I have to implement a copy constructor.
    for (auto X : Map) {
        // cerr << "????";  
        cout << X.key << ' ' << X.value << '\n';
    }

}