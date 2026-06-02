#pragma once

#include <string>

namespace star_map
{
    enum class System
    {
        BetaHydri,
        Sol,
        EpsilonEridani,
        AlphaCentauri,
        DeltaEridani,
        Omicron2Eridani,
    };
}

namespace heaven
{
    class Vessel
    {
    public:
        Vessel(std::string name, int number);
        Vessel(std::string name, int number, star_map::System system);

        std::string name;
        int generation;
        star_map::System current_system;
        int busters;

        heaven::Vessel replicate(std::string name);
        void make_buster();
        bool shoot_buster();
    };

    std::string get_older_bob(Vessel a, Vessel b);
    bool in_the_same_system(Vessel a, Vessel b);
}