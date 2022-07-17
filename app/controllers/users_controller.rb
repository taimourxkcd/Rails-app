class UsersController < ApplicationController


    def index 
    
    @user = User.all
    @user2 = User.find_by(id: 1)
    @car2 = Car.find_by(id: 5)
    end

    def create 

        @user = User.new(user_params)

        if @user.save
            flash[:notice] = "Welcome #{@user.name} you have successfully signed up"
            redirect_to users_path
        else
            render :new
        end
    end

    def show
    @user = User.find_by(params[:id])

    end

    def new
        @user = User.new

        
    end



    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end
