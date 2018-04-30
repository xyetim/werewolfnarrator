class Phase::Day::LynchPhase
  class << self
    def start(game)
      system("say 'Discuss who is going to be lynched today!'")
    end

    def done?(game)
      !!game.game_guide.response
    end

    def end(game)
      target = game.players.find(game.game_guide.response.to_i)
      target.update(alive: false)
      game.update_players
    end

    def next_phase(game)
      Phase::Night::NightStartPhase
    end
  end
end
