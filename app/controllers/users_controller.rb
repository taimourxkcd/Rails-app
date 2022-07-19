class UsersController < ApplicationController
    helper_method :logged_in
    helper_method :current_user

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

    @user = User.find_by(id: params[:id])

    end

    def new
        @user = User.new

        
    end

    def edit

        @user = User.find_by(id: params[:id])
    end

    def update 
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Your account information was successfully updated"
            redirect_to @user
        else
            render 'edit'
        end
    end



    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

    

end
