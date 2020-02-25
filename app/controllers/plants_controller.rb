class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def show
    @booking = Booking.new
    @plant = Plant.find(params[:id])
    @bookings = @plant.bookings
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    if @plant.save!
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    redirect_to plant_path(@plant)
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to plants_path
  end

  private
  def plant_params
    params.require(:plant).permit(:name, :description)
  end
end
