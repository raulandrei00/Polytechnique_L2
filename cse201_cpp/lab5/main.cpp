#include<bits/stdc++.h>
using namespace std;

struct list_t;
void error(std::string str) __attribute__((noreturn));

struct frame_t;

struct node_t {
    virtual node_t* eval (frame_t* frame);
    virtual node_t* apply (list_t* list, frame_t* frame);
    virtual std::string to_string();
    virtual list_t* as_list();
    virtual uintptr_t to_integer ();
    virtual bool is (string id) {
        return false;
    }
};

uintptr_t node_t::to_integer () { error("not integer!"); }

struct integer_t : node_t {
    uintptr_t val;
    integer_t (uintptr_t _v) : val(_v) {} 
    std::string to_string () {
        
        return std::to_string(val);
    }
    uintptr_t to_integer () { return val; }
};

void error(std::string str = "") {
    cerr << str << '\n';
  std::cout << "Error: " << str << std::endl;
  exit(1);
}

node_t* node_t::eval (frame_t* frame) {
    
    return this;
}

node_t* node_t::apply (list_t* list, frame_t* frame) {
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

    node_t** end () {
        return elements + nb_elements;
    }

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
        if (nb_elements == 0) ret.push_back(')');
        else ret[ret.size()-1] = ')';
        return ret;
    }
    node_t* eval (frame_t* frame) {
        // cerr << "here\n";
        return elements[0]->apply(this, frame);
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
    node_t* apply (list_t* lst, frame_t* frame) {
        uintptr_t rez = 0;
        for (int i = 1; i < lst->nb_elements; i++) {
            // cerr << rez << ' ';
            // cerr << lst->elements[i]->eval(frame)->to_string() << '\n';
            rez += lst->elements[i]->eval(frame)->to_integer();
        }
        node_t* result = new integer_t(rez);
        return result;
    }
};

struct set_t : keyword_t {
    set_t () : keyword_t("set!") {}
    node_t* apply (list_t* , frame_t* );
};

struct symbol_t : node_t {
    string id;
    symbol_t (string _id) : id(_id) {}
    bool is (string cmp_id) {
        return cmp_id == id;
    }
    string to_string () {
        return id;
    }

    node_t* eval(frame_t*);

};

struct frame_t : list_t {


    int find (string id) {
        for (int i = 0; i < nb_elements; i++) {
            if (elements[i]->as_list()->at(0)->is(id)) return i;
        }
        return nb_elements;
    }

    void set (node_t* sym , node_t* val) {
        int change = find(sym->to_string());
        if (change == nb_elements) {
            list_t* to_append = new list_t;
            to_append->append(sym);
            to_append->append(val);
            append(to_append);
        }
        else {
            at(change)->as_list()->set_at(1 , val);
        }
    }
    node_t* get (node_t* sym) {
        int pos = find(sym->to_string());
        if (pos == nb_elements) error("symbol not in list!");
        else return at(pos)->as_list()->at(1);
    }
};

node_t* symbol_t::eval(frame_t* frame) {

    return frame->get(this);
}

node_t* set_t::apply (list_t* lst , frame_t* frame) {
    assert (lst->nb_elements == 3);
    // we return the value of the variable as node_t
    frame->set(lst->elements[1] , lst->elements[2]);
    return lst->elements[1]->eval(frame);
}

int main () {
    
    
    // testing set!

    node_t* add = new add_t;
    node_t* sett = new set_t;
    symbol_t* a = new symbol_t { "a" };
    frame_t* frame = new frame_t;

    frame->set(a, new integer_t { 37 });

    list_t* ast = new list_t;

    ast->append(add);
    ast->append(new list_t);
    ast->at(1)->as_list()->append(add);
    // ast->at(1)->as_list()->append(a);
    ast->at(1)->as_list()->append(new list_t);
    // cerr << ast->to_string();
    ast->at(1)->as_list()->at(1)->as_list()->append(sett);
    ast->at(1)->as_list()->at(1)->as_list()->append(a);
    ast->at(1)->as_list()->at(1)->as_list()->append(new integer_t { 69 });
    ast->at(1)->as_list()->append(new integer_t { 2 });
    ast->append(new integer_t { 3 });

    std::cout << ast->to_string() << " => " << ast->eval(frame)->to_string() << std::endl;

    return 0;
}