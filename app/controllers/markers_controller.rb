class MarkersController < ApplicationController
  def index
    @markers = Marker.where(hike_id: params[:hike_id])
    # render json: @markers
  end

  def create
    @marker = Marker.create(marker_params)
    render json: @marker
  end

  def batch_create
    markers_params = params[:markers]
    @markers = markers_params.map { |marker_params| Marker.new(marker_params) }
    Marker.import @markers
    render json: @markers
  end

  private

  def marker_params
    params.require(:marker).permit(:order, :latitude, :longitude, :hike_id)
  end
end
