class Phase::Day::DayStartPhase
  class << self
    def start(game)
      night_targets_names = game.night_targets.map{|p| p.name}.join(" and ")
      system("say 'Everybody wakes up, except for #{night_targets_names}.'")

      # Let players do this themselves?
      # night_targets.each do |player|
      #   system("say '#{player.name} was a #{player.role}.'")
      #   sleep 1
      # end

      game.night_targets.each do |player|
        player.update(alive: false)
      end

      game.players.reload # make sure game object has the latest updates
      game.update_players

      sleep 2
    end

    def done?(game)
      true
    end

    def next_phase(game)
      Phase::Day::MayorPhase
    end
  end
end
