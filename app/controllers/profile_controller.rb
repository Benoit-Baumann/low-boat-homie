class ProfileController < ApplicationController
    before_action :set_rental, only: [:rental_show, :rental_destroy]
    before_action :set_boat, only: [:boat, :boat_edit, :boat_update, :boat_destroy]

    #GET /profile
    def show
        @user = current_user
        authorize @user
    end

    #GET /profile/rentals
    def rentals
        # @rentals = policy_scope(Rental).order(created_at: :desc)
        @user = current_user
        authorize @user
        @rentals = current_user.rentals
    end

    #GET /profile/rentals/:id
    def rental_show
      @user = current_user
        authorize @user
    end

    #DELETE /profile/rental/:id
    def rental_destroy
        @rental.destroy
        respond_to do |format|
          format.html { redirect_to my_rentals_path, notice: 'Rental was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

    #GET /profile/boats
    def boats
        @boats =  policy_scope(Boat).order(created_at: :desc)
        # @boats = current_user.boats
    end

    #GET /profile/boats/:id
    def boat
        @boat = Boat.find(params[:id])
    end

    #GET /profile/boats/:id/edit
    def boat_edit
    end

    #PATCH /profile/boats/:id
    def boat_update
        respond_to do |format|
            if @boat.update(rental_params)
              format.html { redirect_to my_boat_path(@boat), notice: 'Boat was successfully updated.' }
              format.json { render :show, status: :ok, location: @boat }
            else
              format.html { render :edit }
              format.json { render json: @boat.errors, status: :unprocessable_entity }
            end
        end
    end

    #DELETE /profile/boats/:id
    def boat_destroy
        @boat.destroy
        respond_to do |format|
          format.html { redirect_to my_boats_path, notice: 'Boat was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

    private

    def set_rental
        @rental = Rental.find(params[:id])
    end

    def set_boat
        @boat = Boat.find(params[:id])
        authorize @boat
    end

    def boat_params
        params.require(:params).permit(:name, :type, :location, :description)
    end

    # def rental_params
    #     params.require(:rental).permit(:name)
    # end
end
