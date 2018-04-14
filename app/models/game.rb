class Game < ApplicationRecord
  has_many :players, after_add: :player_added, dependent: :destroy

  #serialize :responses, Hash

  enum phases:  [
                  Phase::ConnectionPhase,
                  Phase::AssignRolesPhase,
                  Phase::TwinsPhase,
                  Phase::WerewolvesPhase,
                  Phase::SeerPhase,
                  Phase::MorningRevealPhase,
                  Phase::MayorPhase,
                  Phase::LynchPhase,
                  Phase::TestPhase,
                ].freeze

  # Villagers are filled automagically
  ROLE_POOL = [
                :werewolf,
                :seer,
              ]

  def current_phase
    Game.phases.key(self[:current_phase])
  end

  def current_view(player)
    phase_string = current_phase.name.demodulize.underscore
    view = "game/phases/#{phase_string}/default"

    # check for Specific role view
    if player.role
      role_specific_view = "game/phases/#{phase_string}/#{Player::roles.key(player.role)}"

      if File.file?(role_specific_view)
        view = role_specific_view
      end
    end

    view
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
    self[:current_phase] = Game.phases[current_phase.next_phase(self)]

    current_phase.start(self)
    save

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
