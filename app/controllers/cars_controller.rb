class CarsController < ApplicationController



        def index
            @car = Car.all

        end
    
        def show
            @car = Car.find_by(id: params[:id])
            @book = Book.first

            if @car
                render :show
            else
                redirect_to car_url
            end 
    
        end
    
        
        def create 
            @car = Car.new(car_params)
    
        end


        def new
        
        end

    
        private
    
    
        def book_params
            params.require(:car).permit(:name, :color)
        end
    
    

    

end
