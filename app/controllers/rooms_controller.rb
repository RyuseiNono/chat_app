class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
      if  @room.user_ids.length >= 2 && @room.save
        redirect_to root_path
      else
        render action: :new
        # redirect_to new_room_path
      end
  end

  private
  def room_params
    params.require(:room).permit(:name,user_ids:[])
  end
end