class GameController < ApplicationController
  def index
    # if name already exists in this game
      # get player object
    #else
    @player = Player.create(name: params[:player_name])
    #TODO and add to game object
  end
end
