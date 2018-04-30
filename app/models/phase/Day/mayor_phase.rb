class Phase::Day::MayorPhase
  class << self
    def skip?(game)
      game.players.where(alive: true, mayor: true).any?
    end

    def start(game)
      if !game.players.where(mayor: true).any?
        system("say 'First, discuss who should be the first mayor of this town.'")
      elsif game.players.where(alive: false, mayor: true).any?
        mayor = game.players.where(alive: false, mayor: true).first
        system("say '#{mayor.name} was mayor and chooses their successor'")
      end
    end

    def done?(game)
      if !game.players.where(mayor: true).any?
        !!game.game_guide.response
      elsif game.players.where(alive: false, mayor: true).any?
        !!game.players.where(alive: false, mayor: true).first.response
      end
    end

    def end(game)
      if !game.players.where(mayor: true).any?
        target_id = game.game_guide.response.to_i
      elsif game.players.where(alive: false, mayor: true).any?
        current_mayor = game.players.where(alive: false, mayor: true).first
        target_id = current_mayor.response.to_i
        current_mayor.update(mayor: false)
      end

      target = game.players.find(target_id)
      target.update(mayor: true)
    end

    def next_phase(game)
      Phase::Day::LynchPhase
    end
  end
end
