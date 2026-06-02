#include <string>

#include "pangram.h"

namespace pangram {

bool is_pangram(std::string line) {
    // the alphabet
    const std::string alphabet {"abcdefghijklmnopjrstuvwxyz"};
    
    // make line lowercase
    std::string lowercase {};
    for (auto it = line.begin(); it != line.end(); ++it) {
        lowercase.push_back(tolower(*it));
    }

    // check that each element in the alphabet is in the string
    for (auto it = alphabet.begin(); it != alphabet.end(); ++it) {
        std::size_t n = lowercase.find(*it);
        if (std::string::npos == n) {
            return false;
        }
    }

    return true;
}

}  // namespace pangram
 