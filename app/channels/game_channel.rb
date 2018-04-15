class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_#{params[:player_id]}"

    # Update with latest game state
    player = Player.find(Integer(params[:player_id]))
    Game.first.update_player(player)
  end

  def receive(data)
    Player.find(Integer(params[:player_id])).update(response: data["response"])

    game = Game.first
    game.update_players
    game.phase_done?
  end
end
