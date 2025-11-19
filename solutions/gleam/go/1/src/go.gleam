import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

fn change_player(game: Game) -> Game { 
  case game.player {
    Black -> Game(..game, player: White)
    White -> Game(..game, player: Black)
  }
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  let result = game
    |> rule1
    |> result.map(rule2)
    |> result.try(rule3)
    |> result.try(rule4)

  case result {
    Ok(good) -> change_player(good)
    Error(msg) -> Game(..game, error: msg)
  }
}
