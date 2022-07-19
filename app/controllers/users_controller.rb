class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update]

    def index 
    
    @user = User.all
    
    @users = User.paginate(page: params[:page], per_page: 5)
    
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

 

    end

    def new
        @user = User.new

        
    end

    def edit

     
    end

    def update 
    
        if @user.update(user_params)
            flash[:notice] = "Your account information was successfully updated"
            redirect_to @user
        else
            render 'edit'
        end
    end



    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :user_id)
    end

    def set_user
        @user = User.find(params[:id])
    end

    

end
