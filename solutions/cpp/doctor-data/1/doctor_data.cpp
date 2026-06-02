#include "doctor_data.h"

heaven::Vessel::Vessel(std::string name, int generation)
{
    this->name = name;
    this->generation = generation;
    this->current_system = star_map::System::Sol;
    this->busters = 0;
}

heaven::Vessel::Vessel(std::string name, int generation, star_map::System current_system)
{
    this->name = name;
    this->generation = generation;
    this->current_system = current_system;
    this->busters = 0;
}

heaven::Vessel heaven::Vessel::replicate(std::string new_name)
{
    return Vessel(new_name, this->generation + 1, this->current_system);
}

void heaven::Vessel::make_buster() {
    this->busters++;
    return;
}

bool heaven::Vessel::shoot_buster() {
    if (this->busters > 0) {
        this->busters--;
        return true;
    }
    return false;
}

std::string heaven::get_older_bob(heaven::Vessel a, heaven::Vessel b) {
    return (a.generation < b.generation ? a.name : b.name);
}

bool heaven::in_the_same_system(heaven::Vessel a, heaven::Vessel b) {
    return (a.current_system == b.current_system);
}