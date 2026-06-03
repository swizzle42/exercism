#include "sieve.h"

namespace sieve
{

    // TODO: add your solution here
    std::vector<int> primes(int n)
    {

        if (n < 2)
        {
            return {};
        }

        // initialise the marked vector
        std::vector<bool> marked_primes(n + 1, true);
        marked_primes[0] = marked_primes[1] = false;

        for (int i = 2; i <= n; ++i)
        {
            if (marked_primes[i])
            {
                for (int j = i + i; j <= n; j += i)
                {
                    marked_primes[j] = false;
                }
            }
        }

        std::vector<int> nums{};
        for (int i = 2; i <= n; ++i)
        {
            if (marked_primes[i])
            {
                nums.push_back(i);
            }
        }
        return nums;
    }

} // namespace sieve
