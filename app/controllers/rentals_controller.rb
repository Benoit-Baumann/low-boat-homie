class RentalsController < ApplicationController

  before_action :set_rental, only: [:show, :edit, :destroy, :update]

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
    authorize @rental
    @rental.boat = @boat
    @rental.user = current_user
    @rental.price = @boat.price
    if @rental.save!
      redirect_to rentals_path
    else
      redirect_to new_boat_rental_path(@boat)
    end
  end

    #GET /profile/rentals
    def index
        # @rentals = policy_scope(Rental).order(created_at: :desc)
        @user = current_user
        policy_scope(Rental).order(created_at: :desc)
        @rentals = current_user.rentals
    end

    #GET /profile/rentals/:id
    def show
        @user = current_user
        authorize @rental
    end

    def edit
        authorize @rental
    end

    def update
      authorize @rental
        @rental.update(rental_params)
        redirect_to rentals_path(@rental)
    end

    #DELETE /profile/rental/:id
    def destroy
      authorize @rental
        @rental.destroy
        redirect_to rentals_path
    end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:date)
  end
end
