module TicketPlease exposing (..)

import TicketPleaseSupport exposing (Status(..), Ticket(..), User(..))


emptyComment : ( User, String ) -> Bool
emptyComment (_, c) =
    String.isEmpty c


numberOfCreatorComments : Ticket -> Int
numberOfCreatorComments (Ticket {createdBy, comments}) =
    let
        (creator, _) = createdBy
    in
    comments
        |> List.map Tuple.first
        |> List.filter (\user -> user == creator)
        |> List.length


assignedToDevTeam : Ticket -> Bool
assignedToDevTeam (Ticket { assignedTo }) =
    case assignedTo of
        Nothing ->
            False

        Just (User name) ->
            case name of
                "Alice" ->
                    True
                    
                "Bob" ->
                    True
                    
                "Charlie" ->
                    True

                _ ->
                    False


assignTicketTo : User -> Ticket -> Ticket
assignTicketTo user (Ticket ({status} as ticket)) =
    case status of
        New ->
            Ticket {ticket | status = InProgress, assignedTo = Just user}

        Archived ->
            Ticket ticket

        _ ->
            Ticket {ticket | assignedTo = Just user}
    