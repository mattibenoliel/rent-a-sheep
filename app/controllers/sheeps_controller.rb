class SheepsController < ApplicationController
  before_action :set_sheep, only: [:show, :destroy]
  def index
    @sheeps = Sheep.all
  end

  def show;  end

  def destroy
    @sheep.destroy

    redirect_to sheeps_path
  end

  private

  def set_sheep
    @sheep = Sheep.find(params[:id])
  end

end
