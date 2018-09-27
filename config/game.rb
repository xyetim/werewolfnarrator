Rails.application.configure do
  config.numPlayers = 7
  config.roles = [
    :werewolf,
    :werewolf,
    :seer,
    :twin,
    :twin,
  ]
end
