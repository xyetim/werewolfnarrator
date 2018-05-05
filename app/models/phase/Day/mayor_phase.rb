class Phase::Day::MayorPhase
  class << self
    def skip?(game)
      game.players.where(alive: true, mayor: true).any?
    end

    def start(game)
      if !mayor_exists?(game)
        system("say 'First, discuss who should be the first mayor of this town.'")
      elsif mayor_died?(game)
        mayor = dead_mayor(game)
        system("say '#{mayor.name} was mayor and chooses their successor'")
      end
    end

    def done?(game)
      if !mayor_exists?(game)
        !!game.game_guide.response
      elsif mayor_died?(game)
        !!dead_mayor(game).response
      end
    end

    def end(game)
      if !mayor_exists?(game)
        target_id = game.game_guide.response.to_i
      elsif mayor_died?(game)
        current_mayor = dead_mayor(game)
        target_id = current_mayor.response.to_i
        current_mayor.update(mayor: false)
      end

      target = game.players.find(target_id)
      target.update(mayor: true)
    end

    def next_phase(game)
      Phase::Day::LynchPhase
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
