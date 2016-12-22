class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new article_params

    # проверка на пустые поля
    if @article.valid?
      @article.save
      # перебросит на страницу #show
      redirect_to @article
    else
      render action: 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
