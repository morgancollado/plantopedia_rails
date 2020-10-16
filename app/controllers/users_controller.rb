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
        if logged_in? 
            set_user
        else 
            redirect_to login_path
        end 
    end 

    def edit
        if logged_in?
            set_user
        else 
            redirect_to login_path
        end 
    end 

    def update 
        set_user
        @user.update(user_params)
        redirect_to @user
    end 

    def destroy 
        set_user
        @user.delete
    end 

    private 

    def set_user
        @user = User.find(params[:id])

    end 

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end 
end
