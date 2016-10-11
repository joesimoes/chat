class CommentsController < ApplicationController
  respond_to :js, :json, :html

  def index
    @comment = Comment.new
    @comments = Comment.last(10)
  end

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      redirect_to :back, notice: "Comment failed to save."
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
