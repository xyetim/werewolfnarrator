# README Werewolf narrator

This app acts as the gamemaster/narrator for the game Werewolves of millers hollow. Also known as "Weerwolven van Wakkerdam" in Dutch.

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
 Twins +----- Lynch <--- Mayor <---- Day Start
   |   |                                ^
   V   V                                |
  Night Start ------> Seer -------> Werewolfves


# TODO Full explanation (per role)

- Every body has a phone.
- The laptop will narrate.
- Everybody connect with x.x.x.x
- Peak at you role.
- The Laptop will call you  by role if you need to wake up
- Twins just wake up and press done once
- Seer press who you wnat to spy on. And follow instruction. Dont forget to press done.
- Werewolves. First discuss. At the end one of you has to input what you decided.
- During the day a helper (Me) will input who became mayor and who was lynched.
- Then it will repeat
- Change of double narration. Just continue as normal
- If there is an error just try to play on if it still works.
- You can peak at your role if you really forgot.

