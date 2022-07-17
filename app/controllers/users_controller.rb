class UsersController < ApplicationController


    def index 
    
    @user = User.all
    @user2 = User.find_by(id: 1)
    @car2 = Car.find_by(id: 5)
    end

    def create 
        @user = User.new(params[:user])

        if @user.save
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def show
    @user = User.find_by(params[:id])
    end

    def new
        render :new
        
    end



    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end
