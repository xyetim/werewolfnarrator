class Phase::Prep::ConnectionPhase
  class << self
    def done?(game)
      game.full
    end

    def next_phase(game)
      Phase::Prep::AssignRolesPhase
    end
  end
end
