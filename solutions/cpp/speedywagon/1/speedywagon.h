#pragma once

#include <string>
#include <vector>

namespace speedywagon {

struct pillar_men_sensor {
    int activity{};
    std::string location{};
    std::vector<int> data{};
};

typedef pillar_men_sensor* pillar_man_sensor_handle_t;

bool connection_check(pillar_man_sensor_handle_t sensor_ptr);

int activity_counter(pillar_man_sensor_handle_t sensor_array, size_t capacity);

bool alarm_control(pillar_man_sensor_handle_t sensor_ptr);

bool uv_alarm(pillar_man_sensor_handle_t sensor_ptr);

int uv_light_heuristic(std::vector<int>* data_array);

}  // namespace speedywagon
