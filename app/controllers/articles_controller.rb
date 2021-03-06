class ArticlesController < ApplicationController

  # Не залогиненный пользователь не сможет использовать :new и :create.
  before_filter :authenticate_user!, :only => [:new, :create]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new article_params

    # проверка на пустые поля
    if @article.valid?
      @article.save
      # перебросит на страницу #show
      redirect_to articles_path
    else
      render action: 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    # проверка на пустые поля
    if @article.update(article_params)
      # перебросит на страницу #show
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
