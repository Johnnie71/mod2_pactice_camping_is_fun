class CampersController < ApplicationController
  def index
    @campers = Camper.all
  end

  def show
    @camper = Camper.find(params[:id])
  end

  def new
    @camper = Camper.new
  end

  def create
    camper = Camper.create(params.require(:camper).permit!)

    if camper.valid?
        redirect_to camper_path(camper)
    else
      flash[:my_errors] = camper.errors.full_messages
      redirect_to new_camper_path
    end
  end

  
end
