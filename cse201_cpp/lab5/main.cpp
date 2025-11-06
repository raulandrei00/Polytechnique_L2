#include<bits/stdc++.h>
using namespace std;

struct list_t;
void error(std::string str) __attribute__((noreturn));

struct node_t {
    virtual node_t* eval ();
    virtual node_t* apply (list_t* list);
    virtual std::string to_string();
    virtual list_t* as_list();
};

struct integer_t : node_t {
    uintptr_t val;
    integer_t (uintptr_t _v) : val(_v) {} 
    std::string to_string () {
        
        return std::to_string(val);
    }
};

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

struct list_t : node_t {
    node_t** elements;
    size_t nb_elements;
    size_t capacity;
    list_t() = default;
    list_t* as_list () {
        return this;
    }
    size_t size() { return nb_elements; }
    node_t* at (size_t i) {
        if (i >= nb_elements) error();
        else return elements[i];
    }
    void set_at (size_t i, node_t* val) {
        if (i >= nb_elements) error();
        else elements[i] = val;
    }
    void append (node_t* val) {
        nb_elements++;
        if (nb_elements >= capacity) {
            node_t** saver = (node_t**)malloc(capacity*sizeof(node_t*));
            memcpy(saver , elements, capacity*sizeof(node_t*));
            elements = (node_t**)malloc(2 * nb_elements * sizeof(node_t*));
            capacity = 2*nb_elements;
            memcpy (elements , saver, capacity*sizeof(node_t*));
        }
        
        elements[nb_elements-1] = val;
        
    }
    std::string to_string () {
        std::string ret = "(";
        for (int i = 0; i < nb_elements; i++) {
            ret += elements[i]->to_string() + " ";
            
        }
        ret[ret.size()-1] = ')';
        return ret;
    }
};

struct keyword_t : node_t {
    string id;
    keyword_t (string _id) : id(_id) {}
    string to_string () {
        return "<" + id + ">";
    }
};

struct add_t : keyword_t {
    add_t () : keyword_t("+") {}
};

int main () {
    // integer_t* ast = new integer_t { 3 };
    // std::cout << ast->to_string() << " => " << ast->eval()->to_string() << std::endl;

    // list_t* ast = new list_t;

    // ast->append(new integer_t { 1 });
    // ast->append(new integer_t { 2 });
    // ast->append(new integer_t { 3 });

    // std::cout << ast->to_string() << std::endl; // should outputs (1 2 3)


    node_t* add = new add_t;
    list_t* ast = new list_t;

    ast->append(add);
    ast->append(new list_t);
    ast->at(1)->as_list()->append(add);
    ast->at(1)->as_list()->append(new integer_t { 1 });
    ast->at(1)->as_list()->append(new integer_t { 2 });
    ast->append(new integer_t { 3 });

    std::cout << ast->to_string() << " => " << ast->eval()->to_string() << std::endl;
    std::cout << ast->to_string() << " => " << ast->eval()->to_string() << std::endl;
    // should outputs (<+> (<+> 1 2) 3)

    return 0;
}