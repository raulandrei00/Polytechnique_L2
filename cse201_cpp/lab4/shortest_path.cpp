#include"shortest_path.h"
#include<iostream>

double node_t::distance(node_t* other) {
    
    if (other == nullptr) return 0;
    return location->distance_to(other->location);
}
double node_t::distance(location_t* other) {
    return location->distance_to(other);
}



node_t* node_t::find (location_t* l) {
    node_t* crt = this;
    while (crt != nullptr) {
        if (crt->location->name == l->name) return crt;
        crt = crt->next;
    }
    return nullptr;
}

node_t::node_t (location_t* loc, node_t* from, location_t* dest) : visited(0), location(loc) {
    if (from == nullptr) from_origin = 0;
    else from_origin = from->from_origin + distance(from);
    
    total = from_origin + distance(dest);
    next = nullptr;
}

node_t* node_t::findmin () {
    double minn = 1e9;
    node_t* ptr = nullptr;
    node_t* crt = this;
    while (crt != END) {
        if (crt->visited == 0 && crt->total < minn) {
            minn = crt->total;
            ptr = crt;
        }
        crt = crt->next;
    }
    return ptr;
}

void node_t::erase (node_t* ptr) {
    node_t* crt = this;
    while (crt != END) {
        if (crt == ptr) {
            
        }
    }
    return ;
}

shortest_path_t::shortest_path_t (location_t* _from, location_t* _to) : from(_from) , dest(_to) {}

shortest_path_t::~shortest_path_t() {
    node_t* next = head->next, *prev = head;

    while (next != head->END) {
        // std::cerr << "deleting " << prev->location << '\n';
        delete prev;
        prev = next;
        next = next->next;
    }

    return ;

}

void shortest_path_t::compute () {
    head = new node_t(from , nullptr , dest);
    node_t* back = head;
    base = head;
    while (true) {
        // std::cerr << "Here\n";

        node_t* crt = head->findmin();
        if (crt == nullptr) break;
        crt->visited = 1;
        std :: cerr << crt->location->name << ' ' << crt->from_origin << '\n';

        for (int i = 0; i < crt->location->nb_neighbors; i++) {
            location_t* to = crt->location->adj[i];
            node_t* node_to = head->find(to);
            if (node_to != node_t::END) {
                if (node_to->from_origin > crt->from_origin + crt->distance(node_to)) {
                    node_to = new node_t (node_to->location , crt , dest);
                }
            }
            else {
                back->next = new node_t (crt->location->adj[i] , crt , dest);
                
                back = back->next;
            }
        }
    }
    if (head->find(dest) != head->END)
        found = 1;
    else found = 0;
}

void shortest_path_t::display () {
    if (!found){
        std::cout << "unable to find a path from Bilbao to Palaiseau\n";
        return ;
    }
    std::cout << "path from " << from->name << " to " << dest->name << '\n';
    std::stack<location_t* > path;
    path.push(dest);

    node_t* crt_node = head->find(dest);
    std::cerr << crt_node->location->name << ' ' << crt_node->from_origin << ' ' << crt_node->from << '\n';
    while (crt_node->location != from) {
        crt_node = crt_node->from;
        std::cerr << crt_node << '\n';
        path.push(crt_node->location);
        // std::cerr << "??";
    }

    while (path.size()) {
        auto crt = path.top();
        path.pop();
        std::cout << crt->name << " at " << crt->distance_to(from) << " from " << from->name << '\n';
    }

}