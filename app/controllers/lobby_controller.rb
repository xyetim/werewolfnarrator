class LobbyController < ApplicationController
  def index
  end

  def join
    redirect_to controller: "game", action: "index", player_name: params[:player_name]
  end
end
