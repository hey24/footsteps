class HikesController < ApplicationController

  before_action :set_hike, only: %i[show edit destroy update confirm unconfirm]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @hikes = Hike.all

    @markers = @hikes.geocoded.map do |hike|
      {
        lat: hike.latitude,
        lng: hike.longitude,
        info_window_html: render_to_string(partial: "hike_map_window", locals: {hike: hike}),
        marker_html: render_to_string(partial: "hiker_marker", locals: {hike: hike}),
      }
    end
  end

  def new
    @hike = Hike.new
  end

  def create
    @hike = Hike.new(hike_params)
    @hike.user = current_user
    if @hike.save!
      redirect_to hike_path(@hike)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @request = Request.where(hike: @hike, user: current_user)
    @accepted_requests = Request.where(hike: @hike, request_accepted: true)

    if @hike.in_past?
      @hike.complete_hike!
    end

    @accepted_hiker = @accepted_requests.each do |request|
      User.where(id: request.user_id).first
    end
  end

  def edit; end

  def update
    if @hike.update(hike_params)
      redirect_to hike_path(@hike)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @hike.destroy
    redirect_to hikes_path, status: :see_other
  end

  def confirm
    @hike.hike_confirmed = true
    if @hike.save
      redirect_to hike_path
    else
      render 'hikes/show', status: :unprocessable_entity
    end
  end

  def unconfirm
    @hike.hike_confirmed = false
    if @hike.save
      redirect_to hike_path
    else
      render 'hikes/show', status: :unprocessable_entity
    end
  end

  def route
    @hike = Hike.find(params[:hike_id])
    @markers = @hike.markers.order(:order)
  end

  private

  def set_hike
    @hike = Hike.find(params[:id])
  end

  def hike_params
    params.require(:hike).permit(
      :hike_name, :hike_description, :difficulty, :distance, :max_people,
      :hike_date, :photo, :starting_point, :hike_confirmed, :hike_completed
    )
  end
end
