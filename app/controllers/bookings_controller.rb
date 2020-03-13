class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @sheep = Sheep.find(params[:sheep_id])
    @booking.sheep = @sheep
    authorize(@booking)
    if @booking.save
      @sheep.available = false
      @sheep.save
      redirect_to dashboard_path, notice: "Your sheep was successfully booked."
    else
      render "sheeps/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
