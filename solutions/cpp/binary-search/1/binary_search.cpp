#include "binary_search.h"

#include <iostream>
#include <stdexcept>

namespace binary_search
{
    // TODO: add your solution here
    std::size_t find(const std::vector<int> &data, const int target)
    {
        if (data.empty())
        {
            throw std::domain_error("ERROR: Data is empty.");
        }

        std::size_t low = 0;
        std::size_t high = data.size() - 1;

        while (low <= high)
        {
            std::size_t mid = low + (high - low) / 2;

            if (data[mid] == target)
            {
                return mid;
            }

            else if (data[mid] > target)
            {
                if (mid == 0)
                {
                    break;
                }

                high = mid - 1;
            }
            else
            {
                low = mid + 1;
            }
        }

        throw std::domain_error("ERROR: Could not find target in data.");
    }

} // namespace binary_search
