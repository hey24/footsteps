class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @hikes_created_by_user = Hike.where(user_id: current_user)
  end
end
