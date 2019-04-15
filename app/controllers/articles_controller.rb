class ArticlesController < ApplicationController

  def index
    @articles = Article.all.includes(:user).order('id DESC')
  end

  def new

  end

  def create
    @article = Article.create(name: article_params[:name], title: article_params[:title], article: article_params[:article], user_id: current_user.id)
  end

  def destroy
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.destroy
    end
    redirect_to action: 'index'
  end

  def edit
    Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(article_params)
    end
    redirect_to action: 'index'
  end

  private
  def article_params
    params.permit(:name, :title, :article)
  end
end
