class UsersController < ApplicationController

    def new 
        @user = User.new

    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = user.id
            redirect_to @user 
        else 
            render :new
        end 
    end 

    def show 
        if current_user != set_user
            redirect_to current_user
        end 
    end 

    def edit

    end 

    def update 

    end 

    private 

    def set_user
        @user = User.find(params[:id])

    end 

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end 
end
