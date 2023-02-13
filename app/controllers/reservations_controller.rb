class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new

    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:room_id])
    
    render 'rooms/show' if @reservation.invalid?
    
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    #@reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    #@total_rate = @reservation.room.single_rate * @reservation.number_of_people * (@reservation.end_date - @reservation.start_date).to_i
    #@reservation = current_user.reservations.build(reservation_params)
    # room_idの情報はフォームから送られないので、deviseのメソッドで追加
    #@reservation.user_id = current_user.id
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to reservation_path(@reservation.room.id)
    else
      @room = Room.find(params[:reservation][:room_id])
      @user = User.find(params[:reservation][:user_id])
      render "rooms/show"
    end

  

  end

  def show 
    @reservation = Reservation.find(params[:id])
    @room = Room.find(params[:id])
    #@reservationからroomのnameを出力しようとすると同じ部屋名しか出てこなかったのでRoomモデルでインスタンスを作成し@roomに代入。ルーティングでreservation/showではreservation/:idだったのでURLのidからRoom情報を取得してきている。
  end

  private
  

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_people, :total_price, :room_id, :user_id, :price)
  end
end
