#include"location.h"

struct node_t {
    static constexpr node_t* END = nullptr;
    node_t* next, *from;
    location_t* location;
    double from_origin, total;
    bool visited;
    node_t ();
    node_t (location_t* loc, node_t* from, location_t* dest);
    double distance(node_t* );
    double distance(location_t* );
    node_t* find (location_t* );
    node_t* findmin ();
    void erase (node_t* ptr);
};

struct shortest_path_t {
    node_t* head;
    node_t* base;
    location_t* from , *dest;
    shortest_path_t(location_t* , location_t* );
    void compute ();
    void display ();
    bool found = 0;
    ~shortest_path_t();
};