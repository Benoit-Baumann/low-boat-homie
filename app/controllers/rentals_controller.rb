class RentalsController < ApplicationController
  def new
    @boat = Boat.find(params[:boat_id])
    @rental = Rental.new
    authorize @boat
    authorize @rental
  end

  def create
    @rental = Rental.new(rental_params)
    # we need `boat_id` to associate rental with corresponding boat
    @boat = Boat.find(params[:boat_id])
    authorize @boat
    authorize @rental
    @rental.boat = @boat
    @rental.user = current_user
    @rental.price = @boat.price
    if @rental.save!
      redirect_to boat_path(@boat)
    else
      redirect_to new_boat_rental_path(@boat)
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:date)
  end
end
