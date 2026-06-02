#pragma once

#include <string>
#include <memory>

namespace troy
{

    struct artifact
    {
        // constructors needed (until C++20)
        artifact(std::string name) : name(name) {}
        std::string name;
    };

    struct power
    {
        // constructors needed (until C++20)
        power(std::string effect) : effect(effect) {}
        std::string effect;
    };

    struct human
    {
        human() {}
        std::unique_ptr<artifact> possession = nullptr;
        std::shared_ptr<power> own_power = nullptr;
        std::shared_ptr<power> influenced_by = nullptr;
    };

    void give_new_artifact(human &person, std::string artifact_name);
    void exchange_artifacts(std::unique_ptr<artifact> &a, std::unique_ptr<artifact> &b);
    void manifest_power(human &h, const std::string effect);
    void use_power(human &caster, human &target);
    int power_intensity(human &h);

} // namespace troy
