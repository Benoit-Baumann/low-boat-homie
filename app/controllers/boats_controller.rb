class BoatsController < ApplicationController

    # GET /boats
    def index
        if params[:search].nil?
            # @boats = policy_scope(Boat)
            redirect_to root_path
        else
            @query = params[:search][:query]
            @boats = policy_scope(Boat).near(@query, 20)

            @boats_geo = policy_scope(Boat).near(@query, 20).geocoded

            @markers = @boats.map do |boat|
                {
                    lat: boat.latitude,
                    lng: boat.longitude
                }
            end

        end
    end

    #GET /boats/:id
    def show
        @boat = Boat.find(params[:id])
        authorize @boat
    end

    #GET /boats
    def search
        #To be modified later
        @boats = Boat.all
        authorize @boats
    end

end
