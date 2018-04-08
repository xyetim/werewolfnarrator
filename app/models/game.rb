class Game < ApplicationRecord
  has_many :players

  enum phases:  [
                  Phase::TestPhase,
                ].freeze

  def current_view(player)
    phase = Game.phases.key(current_phase)
    phase_string = phase.name.demodulize.underscore
    "game/phases/#{phase_string}/#{player.role || 'default'}"
  end
end
