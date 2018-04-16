class Phase::TwinsPhase
  class << self
    def skip?(game)
      !game.roles.include?(:twin)
    end

    def before_start(game)
      system("say 'Everybody goes to sleep.'")
      sleep 4
    end

    def start(game)
      system("say 'The twins wake up, and find their counterpart. When they have found each other they press DONE.'")
    end

    def done?(game)
      game.players.where(role: :twin).all? {|player| player.response == "ready"}
    end

    def end(game)
      system("say 'The twins go back to sleep.'")
      sleep 2
    end

    def next_phase(game)
      Phase::WerewolvesPhase
    end
  end
end
