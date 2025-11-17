pub fn expected_minutes_in_oven() {
  40
}

pub fn remaining_minutes_in_oven(elapsed: Int) {
  expected_minutes_in_oven() - elapsed
}

pub fn preparation_time_in_minutes(layers: Int) {
  2 * layers
}

pub fn total_time_in_minutes(layers, elapsed) {
  preparation_time_in_minutes(layers) + elapsed
}

pub fn alarm() {
  "Ding!"
}