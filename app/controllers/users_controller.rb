class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @owned_hikes = current_user.hikes
    @owned_hikes.complete_hikes_if_necessary!
    @joined_hikes = current_user.requested_hikes
    @joined_hikes.complete_hikes_if_necessary!
  end
end
