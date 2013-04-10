class ArticlesController < ApplicationController

  before_filter :require_login, except: [ :index, :show ]

  helper_method :current_blog

  def current_blog
    @blog = Blog.find_by_path(params[:blog_id])
    unless @blog
      flash[:message] = "Blog does not exist"
      redirect_to blogs_path
    end
    @blog
  end

  def index
    @articles = current_blog.articles
  end

  def show
    @article = current_blog.articles.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = current_blog.articles.build
  end

  def create
    @article = current_blog.articles.create params[:article]

    if @article.valid?
      redirect_to blog_article_path(current_blog,@article)
    else
      render :new
    end
  end

  def edit
    @article = current_blog.articles.find(params[:id])
  end

  def update
    @article = current_blog.articles.find(params[:id])

    # An alternative to updating the article
    # Article.update @article, params[:article]

    if @article.update_attributes params[:article]
      flash[:message] = "You're awesome, you updated the article"
      redirect_to blog_article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article = current_blog.articles.find(params[:id])
    @article.destroy
    flash[:message] = "You're awesome, You deleted article '#{@article.title}'"
    redirect_to blog_articles_path
  end

end