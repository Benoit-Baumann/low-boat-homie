class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  before_action :set_boat, only: [:boat, :edit, :update, :destroy]

    # GET /boats
    def index
        if params[:city].present?
            @city = params[:city].capitalize
            @distance = params[:distance].to_i

            @boats = policy_scope(Boat).near(@city, @distance).where("boats.owner_id != ?", current_user.id)

            #.geocoded nécessaire d'après cours mais résultats similaires sans
            # @boats_geo = policy_scope(Boat).near(@query, 20).geocoded

            @markers = @boats.map do |boat|
                {
                    lat: boat.latitude,
                    lng: boat.longitude,
                    infoWindow: render_to_string(partial: "info_window", locals: { boat: boat })
                }
            end
        else
            #Requis pour éviter erreur Pundit "Pundit::PolicyScopingNotPerformedError in BoatsController#index"
            #Skiper pundit pour la méthode index et search ???
            @boats = policy_scope(Boat)
            redirect_to root_path
        end
    end

    #GET /boats/:id
    def show
        @boat = Boat.find(params[:id])
        @rental = Rental.new
        authorize @boat
    end

    #GET /boats
    def search
        @boats = policy_scope(Boat)
        # authorize @boats
    end

    def boats
      @boats = current_user.boats
      authorize @boats
    end

    def boat
      authorize @boat
    end

    def edit
    end

    def new
      @boat = Boat.new
      authorize @boat
    end

    def create
      @boat = Boat.new(boat_params)
      authorize @boat
      @boat.owner = current_user
      @boat.save!
      redirect_to boat_path
    end

    #PATCH /profile/boats/:id
    def update
          @boat.update(boat_params)
          redirect_to boat_path(@boat)
    end

    #DELETE /profile/boats/:id
    def destroy
      authorize @boat
      @boat.destroy
      redirect_to my_boats_path
    end

    private

    def set_boat
        @boat = Boat.find(params[:id])
        authorize @boat
    end

    def boat_params
        params.require(:boat).permit(:name, :category, :location, :description, :price)
    end

end
