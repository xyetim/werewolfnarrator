# README Werewolf narrator v2

This app acts as the gamemaster/narrator for the game Werewolves of millers hollow. Also known as "Weerwolven van Wakkerdam" in Dutch.
This is a second iteration with a new core setup:
- Seperate layout from data
- Use PWA cache to speed up layouts and images
- Only serve data in JSON format
- Serve this JSON format through the action cable too
- Make some tests!

# Overview of the game phases (including some setup stuff)

       |
       V
  Connection
       |
       V
  Assign Roles
       |
       V
    Twins
       |
       |
       V
    Night Start < --- Lynch --------+
       |                ^           |
       V                |           |
      Seer            Mayor         |---> End
       |                ^           |
       V                |           |
    Werewolves ---> Day start ------+

# Data availible to a player (front-end) in JSON form (W.I.P.)
{
  current_time: "nighttime"
  current_phase: "werwolf phase"
  players: [
    frank: {
      is_you: true,
      alive: true,
      role: "werewolf",
    },
    alberta: {
      alive: false,
      role: "werewolf",
      mayor: true,
    }
    Bob: {
      alive: true,
    }
  ]
  actions: {
    werewolve_pick: {
      your_action: true,
      pick_from: "players",
      message: "Choose a player to kill this night",
    },
    mayor_successor: {
      your_action: false,
      message: "The Mayor pick their successor",
    }
  }
}
