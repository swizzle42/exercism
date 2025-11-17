module TicketPlease exposing (..)

import TicketPleaseSupport exposing (Status(..), Ticket(..), User(..))


emptyComment : ( User, String ) -> Bool
emptyComment input =
    case input of
        (_, "") ->
            True

        _ ->
            False


numberOfCreatorComments : Ticket -> Int
numberOfCreatorComments (Ticket ticket) =
    let
        (creator, _) = ticket.createdBy
        commentCreators = List.map Tuple.first ticket.comments
    in
    List.filter (\user -> user == creator) commentCreators
        |> List.length


assignedToDevTeam : Ticket -> Bool
assignedToDevTeam (Ticket { assignedTo }) =
    case assignedTo of
        Nothing ->
            False

        Just (User name) ->
            name == "Alice" || name == "Bob" || name == "Charlie"


assignTicketTo : User -> Ticket -> Ticket
assignTicketTo user (Ticket ticket) =
    case ticket.status of
        New ->
            Ticket {ticket | status = InProgress, assignedTo = Just user}

        Archived ->
            Ticket ticket

        _ ->
            Ticket {ticket | assignedTo = Just user}
    