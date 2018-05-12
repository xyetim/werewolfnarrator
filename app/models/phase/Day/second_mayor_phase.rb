class Phase::Day::SecondMayorPhase
  class << self
    def skip?(game)
      !game.players.where(alive: false, mayor: true).any?
    end

    def start(game)
      mayor = dead_mayor(game)
      system("say '#{mayor.name} was mayor and chooses their successor'")
    end

    def done?(game)
      !!dead_mayor(game).response
    end

    def end(game)
      current_mayor = dead_mayor(game)
      response = current_mayor.response
      current_mayor.update(mayor: false)

      target = game.players.find(response.to_i)
      target.update(mayor: true)
    end

    def next_phase(game)
      Phase::Night::NightStartPhase
    end

    # sort of private methods:

    def mayor_exists?(game)
      game.players.where(mayor: true).any?
    end

    def mayor_died?(game)
      game.players.where(alive: false, mayor: true).any?
    end

    def dead_mayor(game)
      game.players.where(alive: false, mayor: true).first
    end
  end
end
