import gleam/set.{type Set}
import gleam/list
import gleam/string
import gleam/result

pub fn new_collection(card: String) -> Set(String) {
  set.new()
    |> set.insert(card)
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  case set.contains(collection, card) {
    True -> #(True, collection)
    False -> #(False, set.insert(collection, card))
  }
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let valid = set.contains(collection, my_card) && !set.contains(collection, their_card)
  let new_set = collection |> set.delete(my_card) |> set.insert(their_card)
  #(valid, new_set)
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections
    |> list.reduce(set.intersection)
    |> result.unwrap(set.new())
    |> set.to_list
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
    |> list.fold(set.new(), set.union)
    |> set.to_list
    |> list.length
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
    |> set.filter(string.starts_with(_, "Shiny "))
}
