class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update]
  respond_to :html, :json

  def index
    @articles = Article.all
    respond_with(@articles)
  end

  def show
    respond_with(@article)
  end

  def new
    @article = Article.new
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
  end

  def article_params
    params.require(:article).permit([:title,:body,:read_time])
  end

end
