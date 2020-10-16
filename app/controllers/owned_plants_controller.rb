class OwnedPlantsController < ApplicationController
    before_action :set_user

    def new 
        
        @owned_plant = @user.owned_plants.build
        byebug
    end 

    def create 
        @owned_plant = current_user.owned_plants.build(owned_plants_params)

        if @owned_plant.save
            redirect_to user_path(current_user)
        else 
            render 'owned_plant/new'
        end 
    end 

    private 

    def owned_plants_params
        params.require(:owned_plant).permit(:user_id, :plant_id, :seed_date, :death_date)
    end 

    def set_user
        @user = current_user
    end 


end
