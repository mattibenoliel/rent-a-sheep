class SheepsController < ApplicationController
  def index
  end

  def edit
   @sheep = Sheep.find(params[:id])
 end


 def update
     if @restaurant.update(sheep_params)
       redirect_to sheep_path(@sheep)
     else
       render :edit
     end
 end

end
