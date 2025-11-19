import gleam/dict.{type Dict}
import gleam/option

pub type ScoreBoard =
  Dict(String, Int)

pub fn create_score_board() -> ScoreBoard {
  dict.from_list([
    #("The Best Ever", 1_000_000)
  ])
}

pub fn add_player(
  score_board: ScoreBoard,
  player: String,
  score: Int,
) -> ScoreBoard {
  dict.insert(into: score_board, for: player, insert: score)
}

pub fn remove_player(score_board: ScoreBoard, player: String) -> ScoreBoard {
  dict.delete(from: score_board, delete: player)
}

pub fn update_score(
  score_board: ScoreBoard,
  player: String,
  points: Int,
) -> ScoreBoard {
  let increase = fn(x) {
    case x {
      option.Some(i) -> i + points
      option.None -> 0
    }
  }

  case dict.has_key(score_board, player) {
    False -> score_board
    True -> dict.upsert(score_board, player, increase)
  }
  
}

pub fn apply_monday_bonus(score_board: ScoreBoard) -> ScoreBoard {
  score_board
    |> dict.map_values(fn(_, value) { value + 100 })
}
