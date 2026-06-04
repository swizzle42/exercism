#if !defined(ALPHAMETICS_H)
#define ALPHAMETICS_H

#include <optional>
#include <string>
#include <unordered_map>

namespace alphametics
{

    // TODO: add your solution here

    typedef std::unordered_map<char, int> puzzle_result_t;

    // alphametics solve function
    std::optional<puzzle_result_t> solve(std::string);

} // namespace alphametics

#endif // ALPHAMETICS_H
