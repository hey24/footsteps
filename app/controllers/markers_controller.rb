class MarkersController < ApplicationController
  def index
    @hike = Hike.find(params[:hike_id])
    @markers = @hike.markers.order(:order)
    @marker_coordinates = @markers.map { |marker| [marker.longitude, marker.latitude] }
  end

  def new
    @markers = Marker.where(hike_id: params[:hike_id])
    # render json: @markers
  end

  def create
    @hike = Hike.find(params[:hike_id])

    data = params[:coordinates]
    data.each_with_index do |coord, index|
      @hike.markers.create(
        longitude: coord[0],
        latitude: coord[1],
        order: index
      )
    end

    render json: @hike, status: :created
  end

  private

  def marker_params
    params.require(:marker).permit(:order, :latitude, :longitude, :hike_id)
  end
end
