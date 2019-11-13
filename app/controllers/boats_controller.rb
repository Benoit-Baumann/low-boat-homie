class BoatsController < ApplicationController

    # GET /boats
    def index
        @query = params[:search][:query]
        @boats = policy_scope(Boat).near(@query, 20)
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
