class OwnedPlantsController < ApplicationController
    before_action :set_user
    before_action :set_plant, only: [:new, :create]

    def new 
        @owned_plant = @user.owned_plants.build
    end 

    def create 
        @owned_plant = current_user.owned_plants.build(owned_plants_params)
        
        if @owned_plant.save
            redirect_to user_path(current_user)
        else 
            render 'owned_plants/new'
        end 
    end 

    def edit
        @owned_plant = OwnedPlant.find(params[:id])
    end 

    def update
        @owned_plant = OwnedPlant.find(params[:id])
        if @owned_plant.update(owned_plants_params)
            redirect_to user_path(current_user)
        else 
            render 'owned_plant/new'
        end 
    end 

    def destroy
        @owned_plant = OwnedPlant.find(params[:id])
        @owned_plant.delete
        redirect_to user_path(current_user)
    end 

    private 

    def owned_plants_params
        params.require(:owned_plant).permit(:user_id, :plant_id, :seed_date, :death_date)
    end 

    def set_user
        @user = current_user
    end 

    def set_plant
        if params[:plant_id]
        @plant = Plant.find(params[:plant_id])
        end 
    end 


end
