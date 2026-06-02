#include <iostream>
#include <stdexcept>
#include <vector>

#include "nth_prime.h"

namespace nth_prime
{

    // TODO: add your solution here
    bool is_prime(int n)
    {
        if (n <= 1)
        {
            return false;
        }
        if (n == 2)
        {
            return true;
        }
        if (n % 2 == 0)
        {
            return false;
        }

        // only check odd numbers up to the sqrt of n
        for (int i = 3; i * i <= n; i += 2)
        {
            if (n % i == 0)
            {
                return false;
            }
        }

        return true;
    }

    int nth(const int n)
    {
        // guard against zero or negative n
        if (n <= 0)
        {
            throw std::domain_error("Cannot find the 0th or the -nth prime");
        }

        if (n == 1)
        {
            return 2;
        }

        // start generating primes
        int prime_count = 1;
        int candiate = 3;

        while (prime_count < n)
        {
            if (is_prime(candiate))
            {
                prime_count++;
                if (prime_count == n)
                {
                    return candiate;
                }
            }

            candiate += 2; // check the next odd number
        }

        return candiate;
    }

} // namespace nth_prime
