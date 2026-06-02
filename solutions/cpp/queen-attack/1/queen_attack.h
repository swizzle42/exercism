#pragma once

#include <vector>
#include <utility>

namespace queen_attack
{

    /**
     * @brief chess board class
     */
    class chess_board
    {
        const std::pair<int, int> _white;
        const std::pair<int, int> _black;

    public:
        chess_board(const std::pair<int, int> white, const std::pair<int, int> black);
        const std::pair<int, int> white() const;
        const std::pair<int, int> black() const;

        bool can_attack() const;
    };

} // namespace queen_attack
