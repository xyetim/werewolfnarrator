class Player < ApplicationRecord
  belongs_to :game

  enum role: [
                :villager,
                :werewolf,
                :seer,
                :twin,
              ].freeze

  def update_player
    ActionCable.server.broadcast "game_#{id}",
    {
      header_content: render_header_view,
      phase_content: render_current_phase_view,
    }
  end

  # WARNING USING render IN THIS WAY IS VERY UNUSUAL. IT WOULD NORMALLY BE DONE IN THE CONTROLLER / CHANNEL
  def render_current_phase_view
    phase_module = game.current_phase.name.deconstantize.split("::").last.underscore
    phase_string = !game.in_phase_transition ? game.current_phase.name.demodulize.underscore : "non-existent"

    views_order = [
                    "game/phases/default_#{phase_module}",
                    "game/phases/#{phase_string}/default",
                    "game/phases/#{phase_string}/#{role}",
                  ]

    phase_content = nil
    views_order.each do |view|
      begin
        phase_content = ApplicationController.new.render_to_string(partial: view, layout: false, locals: {"@game": game, "@player": self})
      rescue ActionView::MissingTemplate
      end
    end

    # check if a view has been found
    raise ActionView::MissingTemplate unless phase_content

    phase_content
  end

  # WARNING USING render IN THIS WAY IS VERY UNUSUAL. IT WOULD NORMALLY BE DONE IN THE CONTROLLER / CHANNEL
  def render_header_view
    ApplicationController.new.render_to_string(partial: "game/header_content", layout: false, locals: {"@game": game, "@player": self})
  end
end
