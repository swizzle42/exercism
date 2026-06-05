#include "robot_simulator.h"

namespace robot_simulator
{

    // TODO: add your solution here
    Robot::Robot() : _position({0, 0}), _bearing(Bearing::NORTH) {};
    Robot::Robot(position_t position, Bearing bearing) : _position(position), _bearing(bearing) {}

    position_t Robot::get_position() const
    {
        return _position;
    }

    Bearing Robot::get_bearing() const
    {
        return _bearing;
    }

    void Robot::turn_right()
    {
        switch (_bearing)
        {
        case Bearing::NORTH:
            _bearing = Bearing::EAST;
            break;

        case Bearing::EAST:
            _bearing = Bearing::SOUTH;
            break;

        case Bearing::SOUTH:
            _bearing = Bearing::WEST;
            break;

        case Bearing::WEST:
            _bearing = Bearing::NORTH;
            break;
        }
    }

    void Robot::turn_left()
    {
        switch (_bearing)
        {
        case Bearing::NORTH:
            _bearing = Bearing::WEST;
            break;

        case Bearing::EAST:
            _bearing = Bearing::NORTH;
            break;

        case Bearing::SOUTH:
            _bearing = Bearing::EAST;
            break;

        case Bearing::WEST:
            _bearing = Bearing::SOUTH;
            break;
        }
    }

    void Robot::advance()
    {
        switch (_bearing)
        {
        case Bearing::NORTH:
            ++_position.second;
            break;

        case Bearing::EAST:
            ++_position.first;
            break;

        case Bearing::SOUTH:
            --_position.second;
            break;

        case Bearing::WEST:
            --_position.first;
            break;
        }
    }

    void Robot::execute_sequence(const std::string &seq)
    {
        for (char c : seq)
        {
            switch (c)
            {
            case 'R':
                this->turn_right();
                break;

            case 'L':
                this->turn_left();
                break;

            case 'A':
                this->advance();
                break;

            default:
                break;
            }
        }
    }

} // namespace robot_simulator
