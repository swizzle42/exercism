import gleam/string
import gleam/list

pub fn message(log_line: String) -> String {
  case log_line {
    "[ERROR]:" <> msg -> msg |> string.trim
    "[WARNING]:" <> msg -> msg |> string.trim
    "[INFO]:" <> msg -> msg |> string.trim
    other -> other |>string.trim
  }
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[ERROR]" <> _ -> "error"
    "[WARNING]" <> _ -> "warning"
    "[INFO]" <> _ -> "info"
    other -> other
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
