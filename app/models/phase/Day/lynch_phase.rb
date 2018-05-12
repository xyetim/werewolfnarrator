class Phase::Day::LynchPhase
  class << self
    def start(game)
      system("say 'Discuss who is going to be lynched today!'")
    end

    def done?(game)
      !!game.game_guide.response
    end

    def end(game)
      response = game.game_guide.response

      if response != "tied"
        target = game.players.find(response.to_i)
        target.update(alive: false)
        game.update_players
      end
    end

    def next_phase(game)
      Phase::Day::SecondMayorPhase
    end
  end
end
