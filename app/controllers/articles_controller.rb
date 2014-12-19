class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]
  respond_to :html, :json

  def index
    @articles = Article.all
    respond_with(@articles)
  end

  def show
    if @article.tag_id
      @tag=Tag.find(@article.tag_id)
    
  end
  
    respond_with(@article)
  end

  def new
    @article = Article.new
    @tags= Tag.all
    respond_with(@article)
  end

  def create
    @article = Article.create(article_params)
    respond_with(@article)
  end

  def edit
    respond_with(@article)
  end

  def update
    @article.update article_params
    respond_with(@article)
  end

  private

  def set_article
    @article = Article.find(params[:id])
    @article.read_time =read_time
    if params[:tag_id]
      @article.tag_id = params[:tag_id]
    end
  end

  def article_params
    
    params.require(:article).permit([:title,:body,:read_time, :tag_id])
  end
  
  def read_time
    #According to wiki the average user reads 200 words per minute on a monitor, Which equates to 4 words a second. 
  @article.body.split.size/4
  end
  

end
