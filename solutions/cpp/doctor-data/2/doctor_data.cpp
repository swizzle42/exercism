#include "doctor_data.h"

namespace heaven
{
    Vessel::Vessel(
        std::string name,
        int generation,
        star_map::System current_system) : name(name), generation(generation), current_system(current_system)
    {
    }

    Vessel Vessel::replicate(std::string new_name)
    {
        return Vessel(new_name, this->generation + 1, this->current_system);
    }

    void Vessel::make_buster()
    {
        this->busters++;
        return;
    }

    bool Vessel::shoot_buster()
    {
        if (this->busters)
        {
            --this->busters;
            return true;
        }
        return false;
    }

    std::string get_older_bob(Vessel a, Vessel b)
    {
        return (a.generation <= b.generation ? a.name : b.name);
    }

    bool in_the_same_system(Vessel a, Vessel b)
    {
        return (a.current_system == b.current_system);
    }

} // namespace heaven
