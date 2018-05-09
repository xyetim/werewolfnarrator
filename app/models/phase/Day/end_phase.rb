class Phase::Day::EndPhase
  class << self
    def start(game)
      system("say 'The #{game.won_by} have won!'")
    end

    def done?(game)
      false
    end

    def next_phase(game)
      nil
    end
  end
end
