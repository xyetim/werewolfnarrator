Rails.application.configure do
  config.numPlayers = 4
  config.roles = [
    :werewolf,
    #:werewolf,
    :seer,
    #:twin,
    #:twin,
  ]
end
