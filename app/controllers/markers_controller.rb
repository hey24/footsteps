require 'haversine'

class MarkersController < ApplicationController
  before_action :authenticate_user!, :authorize_hike_owner, only: [:new, :create]

  def index
    @hike = Hike.find(params[:hike_id])
    @markers = @hike.markers.order(:order)
    @marker_coordinates = @markers.map { |marker| [marker.longitude, marker.latitude] }
    if @markers.count != 0
      @marker_coordinates = @markers.map { |marker| [marker.longitude, marker.latitude] }
      @marker_initial_coordinates = {
        lng: @markers[0].longitude,
        lat: @markers[0].latitude,
        marker_html: render_to_string(partial: "hikes/start_marker")
      }
      @marker_finish_coordinates = {
        lng: @markers[-1].longitude,
        lat: @markers[-1].latitude,
        marker_html: render_to_string(partial: "hikes/finish_marker")
      }
    end
    @start_coordinates = [@hike.longitude, @hike.latitude]
  end

  def new
    @hike = Hike.find(params[:hike_id])
    @markers = Marker.where(hike_id: params[:hike_id])
    @start_coordinates = [@hike.longitude, @hike.latitude]
  end

  def create
    @hike = Hike.find(params[:hike_id])
    @markers = Marker.where(hike_id: params[:hike_id])
    @markers.destroy_all
    data = params[:coordinates]
    data.each_with_index do |coord, index|
      @hike.markers.create(
        longitude: coord[0],
        latitude: coord[1],
        order: index
      )
    end
    calculate_distance
    render json: @hike, status: :created
  end

  def destroy
    @hike = Hike.find(params[:hike_id])
    @hike.markers.destroy_all
  end

  private

  def marker_params
    params.require(:marker).permit(:order, :latitude, :longitude, :hike_id)
  end

  def authorize_hike_owner
    @hike = Hike.find(params[:hike_id])

    if @hike.user != current_user
      redirect_to hike_path(@hike), alert: "You are not authorized to create a new route for this hike"
    end
  end

  def calculate_distance
    distance_sum = 0.0
    order = 0
    while order < @markers.last.order
      first_marker = @markers.where(order: order).first
      first_marker_coords = [first_marker.latitude, first_marker.longitude]
      second_marker = @markers.where(order: (order + 1)).first
      second_marker_coords = [second_marker.latitude, second_marker.longitude]
      distance_sum += Haversine.distance(first_marker_coords, second_marker_coords).to_kilometers
      order += 1
    end
    @hike.update(distance: distance_sum.round(2))
  end
end
