class CommentsController < ApplicationController

  # Не залогиненный пользователь не сможет использовать :create.
  before_filter :authenticate_user!, :only => [:create]

  def create
    @article = Article.find(params[:article_id])
    @article.comments.create(comment_params)

    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end
