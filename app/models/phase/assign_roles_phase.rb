class Phase::AssignRolesPhase
  class << self
    def before_start(game)
      #random order
      players = game.players.shuffle

      players.each_with_index do |player, i|
        role = game.roles[i] || :villager
        player.update(role: Player::roles[role])
      end
    end

    def done?(game)
      game.players.all? {|player| player.response == "ready"}
    end

    def next_phase(game)
      Phase::TwinsPhase
    end
  end
end
