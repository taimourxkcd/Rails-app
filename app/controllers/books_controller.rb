class BooksController < ApplicationController

    def index
        # @book = Book.all
        @books = Book.paginate(page: params[:page], per_page: 2)
        render :index
    end

    def show

        @book = Book.find_by(id: params[:id])
        
        if @book
            render :show
        else
            redirect_to book_url
        end 

    end

    
    def create 
        @book = Book.new(book_params)

    end

    private


    def book_params
        params.require(:book).permit(:name)
    end


end
