class BoatsController < ApplicationController

    # GET /boats
    def index
        @boats = Boat.all
    end

    #GET /boats/:id
    def show
        @boat = Boat.find(params[:id])
    end
    
end