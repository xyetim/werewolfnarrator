class Game < ApplicationRecord
  has_many :players

  PHASES = [TestPhase]

  def current_view(player)
    current_phase = PHASES.first
    player_role = VILLAGERS #TODO make player.role
    "phases/#{current_phase.name.underscore}/default"
  end
end
