class ArticlesController < ApplicationController
  
  def index
  end

  def show
    @article = Article.find(params[:id])
    render :show
  end

  def new
  end  

  def list
    @article = Article.order(:id)
    render :list
   end 

 # def create
 #   render plain: params[:article].inspect
 # end 

   def create
    @article = Article.new(article_params)
    if @article.valid?
      @article.save
    else
      render action: 'new'
    end  
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  

end