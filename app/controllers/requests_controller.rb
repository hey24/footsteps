class RequestsController < ApplicationController
  before_action :set_hike, only: [:create]

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

  def set_hike
    @hike = Hike.find(params[:hike_id])
  end

  def request_params
    params.require(:request).permit(:request_accepted, :request_pending)
  end
end
