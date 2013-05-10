class ArticlesController < ApplicationController

  before_filter :require_login, except: [ :index, :show ]

  def index
    @articles = all_articles_cached
    @article_count = Article.count
  end

  def all_articles_cached

    Rails.cache.fetch(Cache.articles.all_key,expires_in: Cache.articles.all_time) do
      Article.all
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create params[:article]

    Rails.cache.delete('articles-all')

    if @article.valid?
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    # An alternative to updating the article
    # Article.update @article, params[:article]

    if @article.update_attributes params[:article]
      flash[:message] = "You're awesome, you updated the article"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:message] = "You're awesome, You deleted article '#{@article.title}'"
    redirect_to articles_path
  end

end