class Player < ApplicationRecord
  belongs_to :game

  enum roles: [
                :villager,
                :werewolf,
                :seer,
                :twin,
              ].freeze

  def role
    Player.roles.key(self[:role])
  end

  # WARNING USING render IN THIS WAY IS VERY UNUSUAL. IT WOULD NORMALLY BE DONE IN THE CONTROLLER / CHANNEL
  def update_player
    phase_content = ApplicationController.new.render_to_string(partial: current_view, layout: false, locals: {"@game": game, "@player": self})

    # TODO only update this header if required? sometimes?
    header_content = ApplicationController.new.render_to_string(partial: "game/header_content", layout: false, locals: {"@game": game, "@player": self})

    ActionCable.server.broadcast "game_#{id}",
    {
      header_content: header_content,
      phase_content: phase_content,
    }
  end

  def current_view
    phase_string = game.current_phase.name.demodulize.underscore
    view = "game/phases/#{phase_string}/default"

    # check for Specific role view
    if role
      role_specific_view = "game/phases/#{phase_string}/#{role}"

      if File.file?(role_specific_view)
        view = role_specific_view
      end
    end

    view
  end
end
