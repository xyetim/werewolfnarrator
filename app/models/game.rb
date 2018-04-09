class Game < ApplicationRecord
  has_many :players, after_add: :player_added

  enum phases:  [
                  Phase::ConnectionPhase,
                  Phase::TestPhase,
                ].freeze

  def current_phase
    Game.phases.key(self[:current_phase])
  end

  def current_view(player)
    phase_string = current_phase.name.demodulize.underscore
    "game/phases/#{phase_string}/#{player.role || 'default'}"
  end

  def full
    players.size >= num_players
  end

  def player_added(player)
    update_players
    phase_done?
  end

  def phase_done?
    if current_phase.done?(self)
      next_phase
    end
  end

  def next_phase
    self[:current_phase] += 1
    update_players
  end

  # WARNING USING render IN THIS WAY IS VERY UNUSUAL. IT WOULD NORMALLY BE DONE IN THE CONTROLLER / CHANNEL
  def update_players
    players.each do |player|

      phase_content = ApplicationController.new.render_to_string(partial: current_view(player), layout: false, locals: {"@game": self, "@player": player})

      ActionCable.server.broadcast "game_#{player.id}",
      {
        phase_content: phase_content,
      }
    end
  end
end
