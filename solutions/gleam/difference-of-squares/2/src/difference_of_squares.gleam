pub fn square_of_sum(n: Int) -> Int {
  f(n, 0) * f(n, 0)
}

fn f(x: Int, accumulator) -> Int {
  case x {
    0 -> accumulator
    _ -> f(x - 1, accumulator + x)
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
