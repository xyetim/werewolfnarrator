class Phase::Night::WerewolvesPhase
  class << self
    def skip?(game)
      !game.players.werewolf.where(alive: true).any?
    end

    def start(game)
      system("say 'The werewolves wake up, and choose their target.'")
      sleep 4
    end

    def done?(game)
      !!game.werewolf_leader.response
    end

    def end(game)
      target = game.players.find(game.werewolf_leader.response.to_i)
      game.night_targets.push(target)

      system("say 'The werewolves go back to sleep.'")
      sleep 2
    end

    def next_phase(game)
      Phase::Day::DayStartPhase
    end
  end
end
