class Phase::Night::NightStartPhase
  class << self
    def start(game)
      system("say 'Everybody goes to sleep.'")
      sleep 3
    end

    def done?(game)
      true
    end

    def next_phase(game)
      Phase::Night::TwinsPhase
    end
  end
end
