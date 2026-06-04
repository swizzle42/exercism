#if !defined(ALPHAMETICS_H)
#define ALPHAMETICS_H

#include <optional>
#include <string>
#include <unordered_map>

namespace alphametics
{

    // TODO: add your solution here

    // type alias for result unordered map
    typedef std::unordered_map<char, int> letter_value_map_t;

    // alphametics solve function
    std::optional<letter_value_map_t> solve(std::string);

} // namespace alphametics

#endif // ALPHAMETICS_H
