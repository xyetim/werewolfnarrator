class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_#{params[:player_name]}"
  end
end
