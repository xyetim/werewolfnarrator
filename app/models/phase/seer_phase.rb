class Phase::SeerPhase
  class << self
    def start(game)
      system("say 'The seer wakes up, and chooses who she spies on this night.'")
      sleep 4
    end

    def done?(game)
      game.players.seer.all? {|player| player.response == "ready"}
    end

    def end(game)
      system("say 'The seer goes back to sleep.'")
      sleep 2
    end

    def next_phase(game)
      Phase::MorningRevealPhase
    end
  end
end
