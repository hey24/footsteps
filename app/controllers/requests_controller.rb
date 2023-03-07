class RequestsController < ApplicationController

  def index
    @user_id = current_user.id
    @requests = Request.where(user_id: @user_id)
    @hikes = Hike.where(user_id: @user_id)
  end

  def create
    @request = Request.new(request_params)
    @request.hike = @hike
    @request.user = current_user
    if @request.save
      redirect_to request_path
    else
      render 'requests/new', status: :unprocessable_entity
    end
  end

private

  def request_params
    
  end
end
