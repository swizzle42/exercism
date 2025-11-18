import gleam/list
import gleam/int
import gleam/string

pub fn convert(number: Int) -> String {
  let x = list.filter_map(
    [3,5,7], 
    fn(x) { case x {
        3 -> case number % x == 0 { 
          True -> Ok("Pling")
          False -> Error(Nil)
        }
        5 -> case number % x == 0 { 
          True -> Ok("Plang") 
          False -> Error(Nil)
        }
        7 -> case number % x == 0 { 
          True -> Ok("Plong") 
          False -> Error(Nil)
        }
        _ -> Error(Nil)
      }
    }
  )

  case x {
    [] -> int.to_string(number)
    _ -> string.concat(x)
  }
}
