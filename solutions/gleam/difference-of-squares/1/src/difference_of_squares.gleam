import gleam/int
import gleam/float

pub fn square_of_sum(n: Int) -> Int {
  recursive_sum(n) * recursive_sum(n)
}

fn recursive_sum(n: Int) -> Int {
  case n == 0 {
    True -> 0
    False -> n + recursive_sum(n - 1)
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  case n == 0 {
    True -> 0
    False -> {n * n} + sum_of_squares(n - 1)
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
