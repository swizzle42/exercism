import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  #(place_location.1, place_location.0)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let f = fn(t: #(String, #(Int, String))) { treasure_location_matches_place_location(place.1, t.1) }
  treasures
    |> list.filter(keeping: f)
    |> list.length
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  let f_name = found_treasure.0
  let p_name = place.0
  let d_name = desired_treasure.0

  case f_name, p_name, d_name {
    "Brass Spyglass", "Abandoned Lighthouse", _ -> True
    "Amethyst Octopus", "Stormy Breakwater", d -> case d {
      "Crystal Crab" | "Glass Starfish" -> True
      _ -> False
    }
    "Vintage Pirate Hat", "Harbor Managers Office", d -> case d {
      "Model Ship in Large Bottle" | "Antique Glass Fishnet Float" -> True
      _ -> False
    }
    _, _, _ -> False
  }
}
