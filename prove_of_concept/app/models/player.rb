class Player < ApplicationRecord
  class NoViewError < StandardError; end
  #validates :name, presence: true, length: { minimum: 2 }
  #validate :unique_player_name #TODO

  belongs_to :game

  enum role: [
                :villager,
                :werewolf,
                :seer,
                :twin,
              ].freeze

  def is_werewolf_leader
    game.players.werewolf.where(alive: true).order(:id).first.id == id
  end

  def is_game_guide
    frank = game.players.where(name: ["Frank", "frank"]).first
    other = game.players.where(alive: true).order(:id).first
    leader = frank || other
    leader.id == id
  end

  def update_player
    reload
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

    if alive
      views_order = [
                      "game/phases/default_#{phase_module}",
                      "game/phases/#{phase_string}/default",
                      "game/phases/#{phase_string}/#{role}",
                    ]
    else
      views_order = [
                      "game/phases/default_dead",
                    ]
    end

    dead_mayor = (game.current_phase.name.demodulize == "MayorPhase") ? Phase::Day::MayorPhase.dead_mayor(game) : nil
    views_order.push("game/phases/#{phase_string}/game_guide") if is_game_guide && !dead_mayor
    views_order.push("game/phases/#{phase_string}/mayor") if mayor
    views_order.push("game/phases/#{phase_string}/default") if game.won_by

    phase_content = nil
    views_order.each do |view|
      begin
        phase_content = ApplicationController.new.render_to_string(partial: view, layout: false, locals: {"@game": game, "@player": self})
      rescue ActionView::MissingTemplate
      end
    end

    # check if a view has been found
    raise NoViewError unless phase_content

    phase_content
  end

  # WARNING USING render IN THIS WAY IS VERY UNUSUAL. IT WOULD NORMALLY BE DONE IN THE CONTROLLER / CHANNEL
  def render_header_view
    ApplicationController.new.render_to_string(partial: "game/header_content", layout: false, locals: {"@game": game, "@player": self})
  end

  private

  # TODO
  def unique_player_name
    game.players.where(name: name).any?
  end
end
