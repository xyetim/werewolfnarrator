class Phase::Day::DayStartPhase
  class << self
    def start(game)
      night_targets_names = game.night_targets.map{|p| p.name}.join(" and ")
      system("say 'Everybody wakes up, except for #{night_targets_names}.'")
      sleep 4
    end

    def done?(game)
      false
    end

    def next_phase(game)
      Phase::Day::MayorPhase
    end
  end
end
