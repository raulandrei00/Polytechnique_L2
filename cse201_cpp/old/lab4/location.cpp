#include<bits/stdc++.h>
#include<cmath>
#include<numbers>
#include "location.h"
using namespace std;

location_t::location_t(string _name , double _lat, double _lon): name(_name) , lat(_lat) , lon(_lon) {

}

void location_t::set_neighbors (location_t* list[]) {
    
    for (int i = 0; list[i] != nullptr; i++) {
        nb_neighbors++;
    }
   
    adj = (location_t** ) malloc(nb_neighbors * sizeof(location_t*));
    for (int i = 0; list[i] != nullptr; i++) {
        adj[i] = list[i];
    }

}



double location_t::distance_to (location_t* to) {
    return R * (std::numbers::pi/2 - std::asin(std::sin(to->lat) * std::sin(lat) + std::cos(to->lon - lon) * std::cos(to->lat) * std::cos(lat)));
}

location_t::~location_t () {
    delete [] adj;
}