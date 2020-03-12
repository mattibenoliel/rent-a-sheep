class SheepsController < ApplicationController
  before_action :set_sheep, only: [:show, :destroy, :edit, :update]
  skip_after_action :verify_policy_scoped, only: [:index]
  def index
    if params[:query].present?
      @sheeps = Sheep.global_search(params[:query])
      if params[:start_date].present? && params[:end_date].present?
        overlaping_bookings = Booking.where("start_date <= ? AND ? <= end_date", params[:end_date], params[:start_date])
        @sheeps = @sheeps.where.not(id: overlaping_bookings.pluck(:sheep_id))
      else
        @sheeps = Sheep.global_search(params[:query])
      end
    else
      @sheeps = policy_scope(Sheep)
    end
  end

  def show
    @booking = Booking.new
  end

  def destroy
    @sheep.destroy

    redirect_to sheeps_path
  end

  def new
    @sheep = Sheep.new
    authorize @sheep
  end

  def create
    @sheep = Sheep.new(sheep_params)
    authorize @sheep
    @sheep.user = current_user
    @sheep.address = current_user.address
    if @sheep.save
      redirect_to @sheep, notice: "Your sheep's card was successfully created."
    else
      render :new
    end
  end

  def edit
   @sheep = Sheep.find(params[:id])
  end


 def update
     if @sheep.update(sheep_params)
       redirect_to sheep_path(@sheep)
     else
       render :edit
     end
 end

  private

  def set_sheep
    @sheep = Sheep.find(params[:id])
    authorize @sheep
  end

  def sheep_params
    params.require(:sheep).permit(:nickname, :square_meter_per_hour,:price_per_day, :available, :photo)
  end



end
