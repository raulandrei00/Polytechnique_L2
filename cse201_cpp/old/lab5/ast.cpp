#include"ast.h"

void error(std::string str = "") {
  std::cout << "Error: " << str << std::endl;
  exit(1);
}

node_t* node_t::eval () {
    return this;
}

node_t* node_t::apply (list_t* list) {
    error();
}

std::string node_t::to_string(){
    return "???";
}

list_t* node_t::as_list() {
    error();
}