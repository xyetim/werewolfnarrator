class GameController < ApplicationController
  def index
    # Get running or make new Game
    @game = Game.first #always game 1
    if !@game
      @game = Game.create(num_players: 3) # TODO make seperate game creation screen
    end

    # Get existing player or create new player to the game
    @player = @game.players.where(name: params[:player_name]).first

    if !@player
      if !@game.full
        puts "$$ New Player" + params[:player_name]
        @player = @game.players.create(name: params[:player_name])
      else
        render inline: "Sorry, this game is already full"
      end
    end
  end

  def delete
    Game.destroy_all
    redirect_to controller: "lobby", action: "index"
  end
end
