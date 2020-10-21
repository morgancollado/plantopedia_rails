class SessionsController < ApplicationController 
  

    def new 
    end 

    def create 
        if request.env['omniauth.auth']	
            @user = User.find_or_create_by_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            @user = User.find_by(username: params[:username])
                if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to @user
            else 
                render :new
            end 

        end 
    end 

    def destroy 
        session.delete(:user_id)
    end 

    private 

    def auth
        request.env['omniauth.auth']
    end 

end 