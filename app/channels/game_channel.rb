class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_#{params[:player_id]}"
  end

  def receive(data)
    # TODO fix ths
    Player.find(data[:player_id].to_i).update(response: data[:response])
  end
end
