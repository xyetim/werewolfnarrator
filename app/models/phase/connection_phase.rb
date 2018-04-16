class Phase::ConnectionPhase
  class << self
    def done?(game)
      game.full
    end

    def next_phase(game)
      Phase::AssignRolesPhase
    end
  end
end
