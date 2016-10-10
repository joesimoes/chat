class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @comments = Comment.order('created_at ASC')
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
