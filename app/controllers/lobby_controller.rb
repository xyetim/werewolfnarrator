class LobbyController < ApplicationController
  def index
    @game = Game.first
  end
end
