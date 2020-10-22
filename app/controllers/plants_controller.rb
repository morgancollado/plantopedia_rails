class PlantsController < ApplicationController
    before_action :set_user

    def new 
        @plant = Plant.new
    end 

    def create
        
        @plant = Plant.new(plant_params)
        if @plant.save
            redirect_to @plant
        else 
            render :new
        end 
    end 

    def show 
        @plant = Plant.find(params[:id])
    end 

    def index
        
        @plants = Plant.search(params[:search])
        
        
    end

    private 

    def plant_params
        params.require(:plant).permit(:common_name, :scientific_name)
    end 

    def set_user
        @user = current_user 
    end 
end
