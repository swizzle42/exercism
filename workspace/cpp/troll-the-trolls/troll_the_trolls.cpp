namespace hellmath {

// TODO: Task 1 - Define an `AccountStatus` enumeration to represent the four
// account types: `troll`, `guest`, `user`, and `mod`.
enum class AccountStatus {
    troll = 0,
    guest = 1,
    user = 2,
    mod = 3
};

// TODO: Task 1 - Define an `Action` enumeration to represent the three
// permission types: `read`, `write`, and `remove`.
enum class Action {
    read,
    write,
    remove
};

// TODO: Task 2 - Implement the `display_post` function, that gets two arguments
// of `AccountStatus` and returns a `bool`. The first argument is the status of
// the poster, the second one is the status of the viewer.
bool display_post(AccountStatus poster, AccountStatus viewer) {
    // if the poster is a troll, only a troll view should see
    if (poster == AccountStatus::troll) {
        return viewer == AccountStatus::troll;
    }
    // otherwise all can see
    return true;
}

// TODO: Task 3 - Implement the `permission_check` function, that takes an
// `Action` as a first argument and an `AccountStatus` to check against. It
// should return a `bool`.
bool permission_check(Action action, AccountStatus account) {
    switch (account)
    {
    case AccountStatus::guest:
        return action == Action::read;
    
    case AccountStatus::troll:
    case AccountStatus::user:
        return (action == Action::read 
            ||  action == Action::write);

    case AccountStatus::mod:
        return (action == Action::read 
            ||  action == Action::write 
            ||  action == Action::remove);

    default:
        return false;
    }
} 

// TODO: Task 4 - Implement the `valid_player_combination` function that
// checks if two players can join the same game. The function has two parameters
// of type `AccountStatus` and returns a `bool`.
bool valid_player_combination(AccountStatus a, AccountStatus b) {
    // either a or b are a guest
    if (a == AccountStatus::guest || b == AccountStatus::guest) {
        return false;
    }

    // a is a troll and b isn't a troll or a isn't a troll and b is a troll
    if ((a != AccountStatus::troll) != (b != AccountStatus::troll)) {
        return false;
    }

    // otherwise, return true
    return true;
}

// TODO: Task 5 - Implement the `has_priority` function that takes two
// `AccountStatus` arguments and returns `true`, if and only if the first
// account has a strictly higher priority than the second.
bool has_priority(AccountStatus a, AccountStatus b) {
    return a > b;
}

}  // namespace hellmath
