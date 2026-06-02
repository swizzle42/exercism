#include <string>
#include <unordered_set>

#include "pangram.h"

namespace pangram {

bool is_pangram(std::string line) {
    // the alphabet
    std::unordered_set<char> alphabet {};

    for (char c : line) {
        if (std::isalpha(c)) {
            alphabet.insert(std::tolower(c));
        }
    }

    return (alphabet.size() == 26);
}

}  // namespace pangram
 