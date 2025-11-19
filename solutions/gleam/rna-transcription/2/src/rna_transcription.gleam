import gleam/string
import gleam/list
import gleam/result

pub fn to_rna(dna: String) -> Result(String, Nil) {
  let f = fn(x) { 
    case x {
      "" -> Ok("")
      "G" -> Ok("C")
      "C" -> Ok("G")
      "T" -> Ok("A")
      "A" -> Ok("U")
      _ -> Error(Nil)
    }
  }

  let translation = dna
    |> string.to_graphemes
    |> list.try_map(f)
    |> result.map(string.concat)
}
