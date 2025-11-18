import gleam/list

pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [today, ..] -> today
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [today, ..prev] -> [today + 1, ..prev] 
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  list.any(days, fn(x) { x == 0})
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [first, ..rest] -> first + total(rest)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  days
    |> list.filter(fn(x) { x >= 5 })
    |> list.length
}
