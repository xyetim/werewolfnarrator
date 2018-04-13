class Phase::ConnectionPhase
  def self.done?(game)
    game.full
  end

  def self.next_phase(game)
    Phase::AssignRolesPhase
  end
end
