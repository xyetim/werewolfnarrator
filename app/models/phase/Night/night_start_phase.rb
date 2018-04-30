class Phase::Night::NightStartPhase
  class << self
    def start(game)
      game.night_count += 1

      game.update(night_targets: []) # clear for next night
      system("say 'Everybody goes to sleep.'")
      sleep 3
    end

    def done?(game)
      true
    end

    def next_phase(game)
      if game.night_count == 1
        Phase::Night::TwinsPhase
      else
        Phase::Night::SeerPhase
      end
    end
  end
end
