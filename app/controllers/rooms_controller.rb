class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to room_path(@room), success: "登録完了しました"
    else
      flash.now['danger'] = "登録できませんでした"
      render :new
    end

  end

  def index
    @rooms = Room.all.includes(:user).order(created_at: :desc) #includeじゃなくてpreloadというメソッドの方がいいらしい。N＋1問題
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  


  private

  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :room_image, :room_image_cache)
  end

end
