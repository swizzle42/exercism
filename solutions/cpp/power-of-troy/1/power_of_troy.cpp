#include "power_of_troy.h"

namespace troy
{
    void give_new_artifact(human &person, std::string artifact_name)
    {
        person.possession = std::make_unique<artifact>(artifact(artifact_name));
    }

    void exchange_artifacts(std::unique_ptr<artifact> &a, std::unique_ptr<artifact> &b)
    {
        a.swap(b);
    }

    void manifest_power(human &h, const std::string effect)
    {
        h.own_power = std::make_shared<power>(power(effect));
    }

    void use_power(human &caster, human &target)
    {
        target.influenced_by = caster.own_power;
    }

    int power_intensity(human &h)
    {
        if (h.own_power == nullptr)
        {
            return 0;
        }

        return h.own_power.use_count();
    }

} // namespace troy
