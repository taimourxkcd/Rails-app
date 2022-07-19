class SessionsController < ApplicationController
    helper_method :logged_in
    helper_method :current_user

    def new
        @user = User.new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged in successfully"
            redirect_to user
        else
            flash.now[:alert] = "There was something wrong with your login details"
            redirect_to "/sessions/new"
        end


    end



    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        debugger
        redirect_to root_path
    end




end
