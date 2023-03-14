class RequestsController < ApplicationController
  before_action :set_hike, only: [:create]

  def index
    @user_id = current_user.id
    @requests = Request.where(user_id: @user_id)
    @pending_requests = Request.where(request_pending: true)
    @hikes = Hike.where(user_id: @user_id)
    @accepted_requests = Request.where(request_accepted: true)
  end

  def create
    @request = Request.new
    @request.hike = @hike
    @request.user = current_user
    if @request.save
      redirect_to hike_path(@hike)
    else
      render 'requests/new', status: :unprocessable_entity
    end
  end

  def accept
    # find request instance
    @request = Request.find(params[:request_id])
    # acess accepted field in request
    @request.request_accepted = true
    @request.request_pending = false
    # change value to true, save
    if @request.save
      redirect_to requests_path
    else
      render '/my_hikes', status: :unprocessable_entity
    end
  end

  def reject
    @request = Request.find(params[:request_id])
    @request.request_accepted = false
    @request.request_pending = false
    if @request.save
      redirect_to requests_path
    else
      render '/my_hikes', status: :unprocessable_entity
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
