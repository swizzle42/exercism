#include <stdexcept>

#include "queen_attack.h"

namespace queen_attack
{
    chess_board::chess_board(const std::pair<int, int> white,
                             const std::pair<int, int> black)
        : _white(white), _black(black)
    {
        // guard against invalid positions
        if (white.first < 0 || white.first > 7 || white.second < 0 || white.second > 7)
        {
            throw std::domain_error("White has invalid position");
        }
        if (black.first < 0 || black.first > 7 || black.second < 0 || black.second > 7)
        {
            throw std::domain_error("Black has invalid position");
        }
        if (white == black)
        {
            throw std::domain_error("White and Black do not have distinct positions");
        }
    }

    const std::pair<int, int> chess_board::white() const
    {
        return this->_white;
    }

    const std::pair<int, int> chess_board::black() const
    {
        return this->_black;
    }

    bool chess_board::can_attack() const
    {
        // if white and black are on the same column they can attack
        if (_white.first == _black.first)
        {
            return true;
        }
        // if white and black are on the same row they can attack
        if (_white.second == _black.second)
        {
            return true;
        }
        // if the difference between row and column is equal, they are on a diagonal
        if (abs(_white.first - _black.first) == abs(_white.second - _black.second))
        {
            return true;
        }

        return false;
    }

} // namespace queen_attack
