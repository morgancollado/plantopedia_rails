class PlantLogsController < ApplicationController
    before_action :set_user

    def new 
        @plant_log = @user.plant_logs.build
    end 

    def create 
        @plant_log = current_user.plant_logs.build(plant_log_params)
        byebug

        if @plant_log.save
            redirect_to user_path(current_user)
        else 
            render 'plant_logs/new'
        end 
    end 

    private

    def set_user
        @user = current_user 
    end 

    def set_plant
        @plant = Plant.(params[:id])
    end 

    def plant_log_params
        params.require(:plant_log).permit(:content, :user_id, :owned_plant_id)
    end 
end
