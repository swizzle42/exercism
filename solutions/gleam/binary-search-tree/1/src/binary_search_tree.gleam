import gleam/list

pub type Tree {
  Nil
  Node(data: Int, left: Tree, right: Tree)
}

pub fn to_tree(data: List(Int)) -> Tree {
  list.fold(data, Nil, place_into_tree)
}

fn place_into_tree(tree: Tree, num: Int) -> Tree {
  case tree {
    Nil -> Node(num, Nil, Nil)
    Node(data, left, right) -> case num <= data {
      True -> Node(data, place_into_tree(left, num), right)
      False -> Node(data, left, place_into_tree(right, num))
    }
  }
}

fn to_list(tree: Tree) -> List(Int) {
  case tree {
    Nil -> []
    Node(data, left, right) -> list.append(to_list(left), [data, ..to_list(right)])
  }
}

pub fn sorted_data(data: List(Int)) -> List(Int) {
  data |> to_tree |> to_list
}
