class PlayerController < ApplicationController
  # def show
  #   # # Missing essential param
  #   # id = player_group_params[:public_id]
  #   # if !player_group_params[:public_id]
  #   #   render :nothing => true, :status => :bad_request
  #   # end

  #   # group = PlayerGroup.find(id)
  #   # render json: group.to_json
  # end

  def create
    player = Player.create(player_params)
    render json: player.to_json
  end

  private

  def player_params
    params.require(:player).permit(:name, :playergroup, :game)
  end
end
