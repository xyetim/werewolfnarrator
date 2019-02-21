class PlayerGroupController < ApplicationController

  def index
    # TODO restrict field to be send to the front end
    render json: PlayerGroup.all.to_json
  end

  def show
    # Missing essential param
    id = player_group_params[:public_id]
    if !player_group_params[:public_id]
      render :nothing => true, :status => :bad_request
    end

    group = PlayerGroup.find(id)
    render json: group.to_json
  end

  def create
    group = PlayerGroup.create
    render json: group.to_json
  end

  private

  def player_group_params
    params.require(:player_group).permit(:public_id)
  end
end
