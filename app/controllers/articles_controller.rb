class ArticlesController < ApplicationController
  


  def index
    # @articles = Article.all
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true)

    @q2 = Article.ransack(params[:q])

    @category = Category.all

  end  


  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
      @article = Article.new(article_params)
      @article.user = current_user

      @article.category_ids = article_params[:category_ids]
      @article.save!
  
      
    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to @article

    else
      render :new, status: :unprocessable_entity

    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end


  def join 

    @category = Category.all
    @article = Article.all


  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :status, :category_ids => [])
  end

end


