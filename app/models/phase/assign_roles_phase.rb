class Phase::AssignRolesPhase

  def self.start(game)
    #random order
    players = game.players.shuffle

    players.each_with_index do |player, i|
      role = Game::ROLE_POOL[i] || :villager
      player.update(role: Player::roles[role])
    end
  end

  def self.done?(game)
    game.players.all? {|player| player.response == "ready"}
  end

  def self.next_phase(game)
    Phase::TwinsPhase
  end
end
