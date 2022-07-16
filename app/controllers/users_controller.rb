class UsersController < ApplicationController


    def index 
    
    @user = User.all
    end

    def create 

    end

    def show
    @user = User.find_by(params[:id])
    end


    private
    
    def user_params
        params.require(:user).permit(:name, :email)
    end

end
