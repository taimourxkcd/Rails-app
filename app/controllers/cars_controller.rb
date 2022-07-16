class CarsController < ApplicationController



        def index
            @book = Book.all
            render :index
        end
    
        def show
     
    
        end
    
        
        def create 
            @car = Car.new(car_params)
    
        end
    
        private
    
    
        def book_params
            params.require(:car).permit(:name, :color)
        end
    
    

    

end
