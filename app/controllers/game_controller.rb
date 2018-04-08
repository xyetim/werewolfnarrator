class GameController < ApplicationController
  def index
    # Get running or make new Game
    @game = Game.where(id: 1).first #always game 1
    if !@game
      @game = Game.create(num_players: 3) # TODO make seperate game creation screen
    end

    # Get existing player or create new player to the game
    @player = @game.players.where(name: params[:player_name]).first

    if !@player # TODO and if game not full
      puts "$$ New Player" + params[:player_name]
      @player = Player.create(name: params[:player_name])
      @game.players << @player

      # Let everybody know someone has connected
      # @game.players.each do |player|
      #   # TODO send latest phase info to all
      #   ActionCable.server.broadcast "game_#{player.id}",
      #   {
      #     type: "players-status",
      #     data: @game.players.size,
      #   }
      # end
    end
  end
end
