class RentalsController < ApplicationController
  def rental_new
    @boat = Boat.find(params[:boat_id])
    @rental = Rental.new
  end

  def rental_create
    @rental = Rental.new(rental_params)
    # we need `boat_id` to associate rental with corresponding boat
    @boat = Boat.find(params[:boat_id])
    @rental.boat = @boat
    @rental.user = current_user
    @rental.price = @boat.price
    if @rental.save
      redirect_to boat_path(@boat)
    else
      render :rental_new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:date)
  end
end
