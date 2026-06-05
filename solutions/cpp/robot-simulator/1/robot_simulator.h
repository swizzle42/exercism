#pragma once

#include <string>
#include <utility>

namespace robot_simulator
{

    // TODO: add your solution here
    typedef std::pair<int, int> position_t;

    enum class Bearing
    {
        NORTH = 0,
        EAST = 1,
        SOUTH = 2,
        WEST = 3
    };

    class Robot
    {
        position_t _position;
        Bearing _bearing;

    public:
        Robot();
        Robot(position_t position, Bearing bearing);

        position_t get_position() const;
        Bearing get_bearing() const;

        void turn_right();
        void turn_left();
        void advance();
        void execute_sequence(const std::string &seq);
    };

} // namespace robot_simulator
