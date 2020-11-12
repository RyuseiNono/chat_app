class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    # paramsからidをとって、その部屋のデータをモデルから引っ張ってる
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to  room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render action: :index
      # binding.pry
    end
  end

  private
  def message_params
    params.require(:message).permit(:content,:image).merge(user_id: current_user.id)
    # ストロングパラメータの後に、current_user.idを追加している
  end

end
