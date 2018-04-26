class Phase::TwinsPhase
  class << self
    def skip?(game)
      !game.roles.include?(:twin)
    end

    # should this be here?
    def before_start(game)
      system("say 'Everybody goes to sleep.'")
      sleep 3
    end

    def start(game)
      system("say 'The twins wake up, and find their counterpart.'")
    end

    def done?(game)
      game.players.twin.all? {|player| player.response == "ready"}
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
