#include "speedywagon.h"

namespace speedywagon
{

    // Enter your code below:
    bool connection_check(pillar_man_sensor_handle_t sensor_ptr)
    {
        return sensor_ptr != nullptr;
    }

    int activity_counter(pillar_man_sensor_handle_t sensor_array, size_t capacity)
    {
        int totalActivity{0};
        for (size_t i{0}; i < capacity; ++i)
        {
            totalActivity += sensor_array[i].activity;
        }
        return totalActivity;
    }

    bool alarm_control(pillar_man_sensor_handle_t sensor_ptr)
    {
        if (!connection_check(sensor_ptr))
        {
            return false;
        }

        return sensor_ptr->activity > 0;
    }

    bool uv_alarm(pillar_man_sensor_handle_t sensor_ptr)
    {
        if (!connection_check(sensor_ptr))
        {
            return false;
        }

        return uv_light_heuristic(&sensor_ptr->data) > sensor_ptr->activity;
    }

    // Please don't change the interface of the uv_light_heuristic function
    int uv_light_heuristic(std::vector<int> *data_array)
    {
        double avg{};
        for (auto element : *data_array)
        {
            avg += element;
        }
        avg /= data_array->size();
        int uv_index{};
        for (auto element : *data_array)
        {
            if (element > avg)
                ++uv_index;
        }
        return uv_index;
    }

} // namespace speedywagon
