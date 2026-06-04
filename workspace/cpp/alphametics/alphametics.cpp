#include "alphametics.h"

#include <set>
#include <vector>
#include <cctype>
#include <string>

namespace alphametics
{

    // TODO: add your solution here

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
    letter_value_map_t tokenise(const std::string &puzzle)
    {
        auto unique = get_unique_letters(puzzle);

        std::unordered_map<char, int> tokens{};
        for (char c : unique)
        {
            tokens.insert({c, 0});
        }

        return tokens;
    }

    bool validate_digits(const letter_value_map_t &tokens, const std::set<char> &primaries)
    {
        std::set<int> used_digits{};
        for (auto token : tokens)
        {
            // if the token is primary and has zero value: invalid
            if (primaries.count(token.first) && token.second == 0)
            {
                return false;
            }

            // if the token has a value already in use: invalid
            if (used_digits.count(token.second))
            {
                return false;
            }

            // otherwise, the token is valid
            used_digits.emplace(token.second);
        }

        return true;
    }

    void initialise_token_values(letter_value_map_t &tokens, const std::set<char> &primaries)
    {
        std::set<int> used_digits{};
        for (auto &token : tokens)
        {
            if (primaries.count(token.first))
            {
                // the token is primary, we assign 1 - 9
                for (int i = 1; i <= 9; ++i)
                {
                    if (!used_digits.count(i))
                    {
                        token.second = i;
                        used_digits.insert(i);
                        break;
                    }
                }
            }
            else
            {
                // the token isn't primary, we assign 0 - 9
                for (int i = 0; i <= 9; ++i)
                {
                    if (!used_digits.count(i))
                    {
                        token.second = i;
                        used_digits.insert(i);
                        break;
                    }
                }
            }
        }
    }

    std::vector<int> convert_puzzle_to_nums(
        const letter_value_map_t &tokens,
        const std::vector<std::string> &elements)
    {
        std::vector<int> numbers{};
        for (std::string elem : elements)
        {
            std::string num_string{};
            for (size_t i = 0; i < elem.length(); ++i)
            {
                char ch = elem.at(i);
                num_string += std::to_string(tokens.at(ch));
            }
            numbers.emplace_back(std::stoi(num_string));
        }

        return numbers;
    }

    bool evaluate_puzzle(const letter_value_map_t &tokens, const std::vector<std::string> &elements)
    {
        auto numbers = convert_puzzle_to_nums(tokens, elements);
        int expected = numbers.back();
        numbers.pop_back();

        int sum{0};
        for (int num : numbers)
        {
            sum += num;
        }

        if (sum == expected)
        {
            return true;
        }

        return false;
    }

    bool search(
        const std::set<char>::const_iterator &current_it,
        const std::set<char> &unique_letters,
        letter_value_map_t &tokens,
        const std::set<char> &primaries,
        std::vector<bool> &used_digits,
        const std::vector<std::string> &elements)
    {

        // base case, the puzzle evaluates
        if (current_it == unique_letters.end())
        {
            return evaluate_puzzle(tokens, elements);
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

            tokens[current_letter] = digit;
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

    // solve function
    std::optional<letter_value_map_t> solve(std::string puzzle)
    {
        auto elements = split_puzzle(puzzle);
        auto primaries = get_primaries(elements);
        auto tokens = tokenise(puzzle);
        auto unique_letters = get_unique_letters(puzzle);

        std::vector<bool> used_digits(10, false);

        // initialise_token_values(tokens, primaries);

        if (search(unique_letters.begin(), unique_letters, tokens, primaries, used_digits, elements))
        {
            return tokens;
        }

        return std::nullopt;
    }

} // namespace alphametics
