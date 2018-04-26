class Phase::WerewolvesPhase
  class << self
    def start(game)
      system("say 'The werewolves wake up, and choose their target.'")
      sleep 4
    end

    def done?(game)
      werewolf_response = game.get_werewolf_leader.response
      if werewolf_response
        target = game.players.find(werewolf_response.to_i)
        game.night_targets.push(target)
        true
      else
        false
      end
    end

    def end(game)
      system("say 'The werewolves go back to sleep.'")
      sleep 2
    end

    def next_phase(game)
      Phase::SeerPhase
    end
  end
end
