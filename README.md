# README Werewolf narrator

This app acts as the gamemaster/narrator for the game Werewolves of millers hollow. Also know as "Weerwolven van Wakkerdam" in Dutch.

# Setup
Requirements:
  - Ruby - just a get a recent version
  - Ruby on rails - same
  - For other requirements (gems) run "bundle install"

To see the requirements and their versions see "Gemfile"

# Run locally
run "rails s"

# Favicon
The favicons are generated by realfavicongenerator.net
The master image can be found in app/assets/images.

# Flow chart of the game/role phases
Phases are skipped when no action is required by anyone.
(Example: No Twins in the game, No new mayer needs to be chosen)

   |
   V
Connection
   |
   V
Assign Roles
   |
   V
 Twins +----- Lynch <--------- Mayor
   |   |                         ^
   V   V                         |
    Seer ---> Werewolfves ---> Day Start
