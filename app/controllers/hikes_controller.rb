class HikesController < ApplicationController
  before_action :set_hike, only: %i[show edit destroy update]
  
  def index
    @hikes = Hike.all
    @markers = @hikes.geocoded.map do |hike|
      {
        lat: hike.latitude,
        lng: hike.longitude
      }
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

  def show; end

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

  private

  def set_hike
    @hike = Hike.find(params[:id])
  end

  def hike_params
    params.require(:hike).permit(
      :hike_name, :hike_description, :difficulty, :distance, :max_people,
      :hike_date
    )
  end
 end
