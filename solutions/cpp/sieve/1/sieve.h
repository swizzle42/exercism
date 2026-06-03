#pragma once

#include <vector>

namespace sieve
{

    // TODO: add your solution here

    /**
     * @brief structure for numbers in the sieve
     * containing the value and if the number is marked
     */
    struct number
    {
        int value;
        bool marked;
    };

    std::vector<int> primes(int n);

} // namespace sieve
