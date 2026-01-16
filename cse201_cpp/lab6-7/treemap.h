/// use Valgrind for debugging (segfault, memory)



#include<bits/stdc++.h>
using namespace std;

struct account_t {
    int balance;
    string note;
    account_t () : balance{}, note{""} {

    }
    account_t (int b) : balance{b}, note{""} {}
};

std::ostream& operator << (std::ostream& os, const account_t& account)
{
    if (account.note.size() > 0) {
        return os << account.balance << "$" << " (" << account.note << ")";
    }
    else {
        return os << account.balance << "$";
    }
}

struct lanister_t {
    string name;
    lanister_t () : name{""} {}
    lanister_t (const string& _name) : name{_name} {}
    lanister_t(const char* _name) : name(_name) {}   

    bool operator < (const lanister_t& lanister) const {
        return name < lanister.name;
    }
    bool operator == (const lanister_t& lanister) const {
        return name == lanister.name;
    }
    
};
std::ostream& operator << (std::ostream& os, const lanister_t& lanister)
{
    return os << lanister.name << " Lanister";
}

template<typename K, typename V> 
struct treemap_t {

    struct pair_t {
        const K key;
        V value;
        pair_t (const K _key) : key(_key) {}
    };

    struct node_t : pair_t {
        node_t *parent, *left, *right;
        node_t (node_t* par, const K _key) : pair_t(_key) , parent(par) {
            left = right = nullptr;
        }
        node_t (const node_t& other) : pair_t(other.key) {
            cerr << "copying\n";
            parent = other.parent;
            left = other.left;
            right = other.right;
            this->value = other.value;
        }
    };

    node_t *root;
    
    treemap_t () : root(nullptr) {}

    node_t* lookup (node_t **pcur, node_t *parent, const K &key, bool create) {
        
        if (*pcur == nullptr) {
            if (create) {
                *pcur = new node_t {parent, key};
                // (*pcur)->key = key;
                return *pcur;
            }
            else return nullptr;
        }
        
        node_t* crt = *pcur;
        if (crt->key == key) {
            return crt;
        }
        else if (key < crt->key) {
            return lookup (&crt->left, crt, key, create);
        }
        else return lookup (&crt->right, crt, key, create);
    }

    void set_at (const K& key, const V& value) {
        node_t* node = lookup (&root, nullptr, key, 1);
        node->value = value;
    }

    V& at (const K& key) {
        node_t* node = lookup (&root, nullptr, key, 1);
        // if (node == nullptr){
        //     cerr << "Index error\n";
        //     exit(1);
        // }
        // else 
        return node->value;
    }

    V& operator [] (const K& key) {
        return at(key);
    }

    void dfs_display (node_t* node, int depth = 0) {
        if (node == nullptr) return;
        dfs_display(node->left, depth+1);
        for (int i = 0; i < depth; i++) cout << ' ';
        cout <<"(" << node->key << ", " << node->value << ")\n";
        dfs_display(node->right, depth+1);
    }

    void display () {
        dfs_display(root);
    }

    struct iterator_t {
        node_t* cur;
        iterator_t (node_t* _root) : cur(nullptr) {
            if (_root == nullptr) return;
            cur = _root;
            while (cur->left != nullptr) cur = cur->left;
        }
        void next () {
            if (cur == nullptr) return; 
            if (cur->right != nullptr) cur = cur->right;
            else {
                while (cur->parent != nullptr && cur->parent->right == cur) cur = cur->parent;
                cur = cur->parent;
            }
            
        } 
        iterator_t operator ++ (int) {
            auto return_value = *this;
            next();
            return return_value;
        }
        iterator_t operator ++ () {
            
            next();
            return *this;
        }

        bool operator != (iterator_t other) {
            
            return other.cur != cur;
        }
        bool operator == (iterator_t other) {
            
            return other.cur == cur;
        }

        pair_t& operator* () {
            if (!cur) {
                throw std::runtime_error("Dereferencing end() iterator!");
            }
            return *cur;
        }

        node_t* operator-> () {
            return cur;
        }
        
    };

    iterator_t end () { 
            
        return iterator_t {nullptr}; }
    iterator_t begin () {
            

        return iterator_t(root);
    }

};

