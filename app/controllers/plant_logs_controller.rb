class PlantLogsController < ApplicationController
    before_action :set_user

    def new 
       @plant_log = @user.plant_logs.build({owned_plant_id: params[:owned_plant_id]})
    end 

    def create 
        @plant_log = current_user.plant_logs.build(plant_log_params)
        
        if @plant_log.save
            redirect_to edit_user_owned_plant_path(current_user, @plant_log.owned_plant.id)
        else 
            render 'plant_logs/new'
        end 
    end 

    def edit
        @plant_log = PlantLog.find(params[:id])
        if @plant_log.user.id != current_user
            redirect_to user_path(current_user)
    end 

    def update 
        @plant_log = PlantLog.find(params[:id])
        if @plant_log.update(plant_log_params)
            redirect_to edit_user_owned_plant_path(@plant_log.user_id, @plant_log.owned_plant_id)
        else 
            render 'plant_log/edit'
        end 
    end 

    def destroy
        @plant_log = Plantlog.find(params[:id])
        @plant_log.delete
        redirect_to user_path(current_user)
    end 

    private

    def set_user
        @user = current_user 
    end 

    def plant_log_params
        params.require(:plant_log).permit(:content, :user_id, :owned_plant_id)
    end 
end
