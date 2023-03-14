class ChatroomsController < ApplicationController
  def index
    @hike = Hike.find(params[:hike_id])
    @chatroom = @hike.chatroom
    @message = Message.new
  end
end
