#include <algorithm>
#include "lasagna_master.h"

namespace lasagna_master
{

    // TODO: add your solution here
    int preparationTime(const std::vector<std::string> layers, const int avg_layer_prep_time)
    {
        return avg_layer_prep_time * layers.size();
    }

    amount quantities(std::vector<std::string> layers)
    {
        amount needed{0, 0.0};
        for (const auto &layer : layers)
        {
            if (layer == "noodles")
            {
                needed.noodles += 50;
            }
            else if (layer == "sauce")
            {
                needed.sauce += 0.2;
            }
        }

        return needed;
    }

    void addSecretIngredient(
        std::vector<std::string> &my_ingredients,
        const std::vector<std::string> &friend_ingredients)
    {
        my_ingredients.back() = friend_ingredients.back();
        return;
    }

    std::vector<double> scaleRecipe(const std::vector<double> amounts, const int portions)
    {
        std::vector<double> scaled_amounts;
        scaled_amounts.reserve(amounts.size());

        std::transform(amounts.begin(), amounts.end(),
                       std::back_inserter(scaled_amounts),
                       [portions](double amount)
                       { return (amount / 2) * portions; });

        return scaled_amounts;
    }

    void addSecretIngredient(
        std::vector<std::string> &my_ingredients,
        const std::string secret_ingredient)
    {
        my_ingredients.back() = secret_ingredient;
        return;
    }

} // namespace lasagna_master
