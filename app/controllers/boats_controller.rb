class BoatsController < ApplicationController

    # GET /boats
    def index
        @boats = policy_scope(Boat)
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
