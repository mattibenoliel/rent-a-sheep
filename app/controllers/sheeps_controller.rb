class SheepsController < ApplicationController
  def index
  end

  def new
    @sheep = Sheep.new
  end

  def create
    @sheep = Sheep.new(sheep_params)
    @sheep.user = current_user
    if @sheep.save
      redirect_to @sheep, notice: "Your sheep's card was successfully created."
    else
      render :new

    end
  end

  private

  def sheep_params
    params.require(:sheep).permit(:nickname, :square_meter_per_hour,:price_per_day, :available)
  end
end
