# README Werewolf narrator v2

This app acts as the gamemaster/narrator for the game Werewolves of millers hollow. Also known as "Weerwolven van Wakkerdam" in Dutch.
This is a second iteration with a new core setup:
- Seperate layout from data
- Use PWA cache to speed up layouts and images
- Only serve data in JSON format
- Serve this JSON format through the action cable too
- Use a the finite_machine to keep track of the game progress and trasitions !? (How to handle skipping states?)