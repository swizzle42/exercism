import gleam/string
import gleam/list

pub fn first_letter(name: String) {
  let first = name
    |> string.trim
    |> string.first

  case first {
    Ok(name) -> name
    Error(Nil) -> ""
  }
}

pub fn initial(name: String) {
  name
    |> first_letter
    |> string.uppercase
    |> string.append(".")
}

pub fn initials(full_name: String) {
  full_name
    |> string.split(" ")
    |> list.map(initial)
    |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) {
  let heart = 
      "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     X. X.  +  X. X.     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
  let center = initials(full_name1) <> "  +  " <> initials(full_name2)
  string.replace(heart, "X. X.  +  X. X.", center)
}
