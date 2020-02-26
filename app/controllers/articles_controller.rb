class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy ]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.includes(:user).page(params[:page]).per_page(5).order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "New article has successfully created"
      redirect_to article_path(@article)
    else
      flash.now[:error]= "Something went wrong, try again"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Your article has successfully been updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:success] = "Your article has successfully been deleted"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id, :image)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:error] = "You can only edit or delete your own articles"
      redirect_to root_path
    end
  end

end