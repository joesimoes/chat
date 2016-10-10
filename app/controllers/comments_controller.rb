class CommentsController < ApplicationController
  def index
    @comment = Comment.create(params[:comment])
    @comments = Comment.order('created_at DESC')
  end
end
