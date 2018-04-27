class Phase::Night::TwinsPhase
  class << self
    def skip?(game)
      !game.roles.include?(:twin)
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
      Phase::Night::SeerPhase
    end
  end
end
