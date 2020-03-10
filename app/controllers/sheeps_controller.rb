class SheepsController < ApplicationController
  before_action :set_sheep, only: [:show, :destroy, :edit, :update]
  def index
    @sheeps = policy_scope(Sheep)
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
