# README Werewolf narrator

This app acts as the gamemaster/narrator for the game Werewolves of millers hollow. Also known as "Weerwolven van Wakkerdam" in Dutch.

# Full explanation (Share this info with all players)

- Every player has a phone.
- The laptop will narrate.
- Everybody connect with x.x.x.x:3000

- Peak at you role. Now and later.
- The Laptop will call you by role if you need to wake up

- All voting happens in person. The Game master (me) inputs group results. (Mayor/who lynched)

- Twins just wake up first night and press done once

- Seer press who you want to spy on. And follow instruction. Dont forget to press done.
  - If you need to select you can scroll down.

- Werewolves. First discuss. At the end only one of you has to input what you decided.

- During the day a helper (I) will input who became mayor and who was lynched.

- If there is an error just try to play on if it still works.
- Everybody keep phone in your hand to make minimal noises.

- Game master only: Tied votes looks weird

# Setup
Requirements:
  - Ruby - just a get a recent version
  - Ruby on rails - same
  - For other requirements (gems) run "bundle install"
  - Device must support the `say` command

To see the requirements and their versions see "Gemfile"

# Run locally
run `rails s` to debug
run `scripts/start_production.sh` to play

# Favicon
The favicons are generated by realfavicongenerator.net
The master image can be found in app/assets/images.

# Flow chart of the game/role phases
Phases are skipped when no action is required by anyone.
(Example: No Twins in the game, No new mayer needs to be chosen)

"""
   |
   V
Connection
   |
   V
Assign Roles
   |
   V
 Twins  +----- Lynch <--- Mayor <---- Day Start
   |    |                                ^
   V    V                                |
  Night Start ------> Seer -------> Werewolfves
"""
