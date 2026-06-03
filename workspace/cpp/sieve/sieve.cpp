#include "sieve.h"

#include <algorithm>

namespace sieve
{

    // TODO: add your solution here
    std::vector<int> primes(int n)
    {
        std::vector<int> return_primes{};
        if (n < 2)
        {
            return return_primes;
        }

        // initialise the numbers vector
        std::vector<number> v(n - 1);
        std::generate(v.begin(), v.end(),
                      [n = 2]() mutable
                      { return number{n++, false}; });

        for (auto it = v.begin(); it != v.end(); ++it)
        {
            // if a number is already marked, skip it
            if (it->marked)
            {
                continue;
            }

            // otherwise, it is prime so mark of all greater multiples
            auto mults = it + it->value;
            for (; mults < v.end(); mults += it->value)
            {
                mults->marked = true;
            }
        }

        // now we extract the non-marked numbers
        for (auto &num : v)
        {
            if (!num.marked)
            {
                return_primes.push_back(num.value);
            }
        }

        return return_primes;
    }

} // namespace sieve
