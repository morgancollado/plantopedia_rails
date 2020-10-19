class SessionsController < ApplicationController 
  

    def new 
    end 

    def create 
        if request.env['omniauth.auth']	

            oauth_email = request.env['omniauth.auth']['email']	
             if @user = User.find_by(:email => oauth_email)	
                 session[:user_id] = @user.id	
             else	
                 @user = User.create(:email => oauth_email, :password => SecureRandom.hex)	
                 @user.save	
                 session[:user_id] = @user.id	
 
                # redirect_to photographers_path(@user)	
             end 
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

end 