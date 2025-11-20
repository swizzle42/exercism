import simplifile
import gleam/string
import gleam/list
import gleam/result

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  let read_result = simplifile.read(path) |> result.map_error(fn(_) { Nil }) |> result.map(string.trim)
  use file_content <- result.try(read_result)
  let addresses = string.split(file_content, "\n")
  Ok(addresses)
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  simplifile.create_file(path) |> result.map_error(fn(_) { Nil })
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  simplifile.append(path, email <> "\n") |> result.map_error(fn(_) { Nil })
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  let send_and_log = fn(address) {
    address
      |> send_email
      |> result.try(fn(_) { log_sent_email(log_path, address) })
  }
  use _ <- result.try(create_log_file(log_path))
  use addresses <- result.try(read_emails(emails_path))
  let _ = addresses |> list.map(send_and_log)
  Ok(Nil)
}
