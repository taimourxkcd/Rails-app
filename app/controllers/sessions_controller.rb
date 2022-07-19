class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            flash[:notice] = "Logged in successfully"
            redirect_to user
        else
            flash.now[:alert] = "There was something wrong with your login details"
            render :new
        end



        render :new

    end

    def destroy
    end

end
