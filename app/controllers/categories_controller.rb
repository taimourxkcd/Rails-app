class CategoriesController < ApplicationController

    def new
        @category = Category.new

    end


    def index
      @category = Category.all
      @category_p = Category.paginate(page: params[:page], per_page: 4)
    end

    def show 
        @category = Category.find_by(params[:id])

    end

    def create
          @category = Category.new(category_params)
        #   @category.user = current_user
          
        if @category.save
          flash[:notice] = "Article was successfully created."

          redirect_to categories_url
          

        else
          render :new, status: :unprocessable_entity

        end
      end
private 
      def category_params
        params.require(:category).permit(:name)
      end
     
end
