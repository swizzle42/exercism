#include "alphametics.h"

#include <set>
#include <vector>
#include <cctype>
#include <cmath>
#include <string>
#include <stdexcept>

namespace alphametics
{

    // TODO: add your solution here

    typedef struct
    {
        int value;
        long long weight;
    } token_value_t;

    typedef std::unordered_map<char, token_value_t> token_map_t;

    // split the puzzle on whitespace and add each item to a vector
    std::vector<std::string> split_puzzle(std::string puzzle)
    {
        std::vector<std::string> elems;
        std::string del = " ";

        size_t pos;
        while ((pos = puzzle.find(del)) != std::string::npos)
        {
            auto substr = puzzle.substr(0, pos);
            bool only_alpha{true};
            for (char c : substr)
            {
                if (!isalpha(c))
                {
                    only_alpha = false;
                }
            }

            if (only_alpha)
            {
                elems.emplace_back(substr);
            }

            puzzle.erase(0, pos + del.length());
        }

        // add in any remainder of the puzzle
        if (puzzle.length() > 0)
        {
            elems.emplace_back(puzzle);
        }

        return elems;
    }

    // get a set of the primary letters in the puzzle (these cannot be zero)
    std::set<char> get_primaries(const std::vector<std::string> &elems)
    {
        std::set<char> primaries{};
        for (auto s : elems)
        {
            primaries.emplace(s.front());
        }
        return primaries;
    }

    // get unique characters
    std::set<char> get_unique_letters(const std::string &puzzle)
    {
        std::set<char> unique{};
        for (char c : puzzle)
        {
            if (isalpha(c))
            {
                unique.emplace(c);
            }
        }

        return unique;
    }

    // get each character in the alphametic puzzle and an associated value
    token_map_t tokenise(const std::string &puzzle)
    {
        auto unique = get_unique_letters(puzzle);

        token_map_t tokens{};
        for (char c : unique)
        {
            token_value_t value{0, 0};
            tokens.insert({c, value});
        }

        return tokens;
    }

    void generate_token_weights(token_map_t &tokens, const std::vector<std::string> &elements)
    {
        for (size_t i = 0; i < elements.size() - 1; ++i)
        {
            const std::string &elem = elements[i];
            long long multiplier = 1;

            for (int j = static_cast<int>(elem.length()) - 1; j >= 0; --j)
            {
                char c = elem[j];
                tokens.at(c).weight += multiplier;
                multiplier *= 10;
            }
        }

        // the final element in elements vector is the rhs of the puzzle which has negative weight
        const std::string &final_elem = elements.back();
        long long multiplier = 1;

        for (int j = static_cast<int>(final_elem.length()) - 1; j >= 0; --j)
        {
            char c = final_elem[j];
            tokens.at(c).weight -= multiplier;
            multiplier *= 10;
        }
    }

    bool evaluate_puzzle(const token_map_t &tokens)
    {
        long long total = 0;
        for (const auto &[letter, token_data] : tokens)
        {
            total += token_data.value * token_data.weight;
        }

        return total == 0;
    }

    bool search(
        const std::set<char>::const_iterator &current_it,
        const std::set<char> &unique_letters,
        token_map_t &tokens,
        const std::set<char> &primaries,
        std::vector<bool> &used_digits,
        const std::vector<std::string> &elements)
    {

        // base case, the puzzle evaluates
        if (current_it == unique_letters.end())
        {
            return evaluate_puzzle(tokens);
        }

        // otherwise, get which letter is being worked on
        char current_letter = *current_it;

        for (int digit = 0; digit <= 9; ++digit)
        {
            // if the digit is in use, continue to the next digit
            if (used_digits[digit])
            {
                continue;
            }

            // if the digit is 0 and the letter is primary, move on
            if (digit == 0 && primaries.count(current_letter))
            {
                continue;
            }

            tokens[current_letter].value = digit;
            used_digits[digit] = true;

            auto next_it = current_it;
            ++next_it;

            if (search(next_it, unique_letters, tokens, primaries, used_digits, elements))
            {
                return true;
            }

            used_digits[digit] = false;
        }

        return false;
    }

    puzzle_result_t format_result(const token_map_t &tokens)
    {
        puzzle_result_t result;
        for (const auto &[character, data] : tokens)
        {
            result[character] = data.value;
        }
        return result;
    }

    // solve function
    std::optional<puzzle_result_t> solve(std::string puzzle)
    {
        auto elements = split_puzzle(puzzle);
        auto primaries = get_primaries(elements);
        auto tokens = tokenise(puzzle);
        auto unique_letters = get_unique_letters(puzzle);

        std::vector<bool> used_digits(10, false);

        generate_token_weights(tokens, elements);
        if (search(unique_letters.begin(), unique_letters, tokens, primaries, used_digits, elements))
        {
            return format_result(tokens);
        }

        return std::nullopt;
    }

} // namespace alphametics
