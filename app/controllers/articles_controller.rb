class ArticlesController < ApplicationController

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
    if @article.save
      # перебросит на страницу #show
      redirect_to @article
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

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
