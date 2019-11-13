class BoatsController < ApplicationController

    # GET /boats
    def index
        if params[:search].nil?
            #Requis pour éviter erreur Pundit "Pundit::PolicyScopingNotPerformedError in BoatsController#index"
            #Skiper pundit pour la méthode index et search ???
            @boats = policy_scope(Boat)
            redirect_to root_path
        else
            @query = params[:search][:query]
            @boats = policy_scope(Boat).near(@query, 20)

            #.geocoded nécessaire d'après cours mais résultats similaires sans
            # @boats_geo = policy_scope(Boat).near(@query, 20).geocoded

            @markers = @boats.map do |boat|
                {
                    lat: boat.latitude,
                    lng: boat.longitude,
                    infoWindow: render_to_string(partial: "info_window", locals: { boat: boat })
                }
            end
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
        #To be modified later
        @boats = policy_scope(Boat)
        # authorize @boats
    end

end
