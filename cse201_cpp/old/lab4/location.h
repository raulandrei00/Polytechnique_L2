#include<bits/stdc++.h>

const double R = 6378;


struct location_t {
    std::string name;
    double lat, lon;
    size_t nb_neighbors = 0;
    location_t** adj;

    location_t (std::string , double , double );
    ~location_t ();

    void set_neighbors (location_t* [] );

    double distance_to(location_t* );

};