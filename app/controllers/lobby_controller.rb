class LobbyController < ApplicationController
  def index
    #ActionCable.server.broadcast "game_toki", {message: "somethingy"}
  end

  def join
    redirect_to controller: "game", action: "index", player_name: params[:player_name]
  end
end
