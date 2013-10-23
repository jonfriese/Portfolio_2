class CommentsController < ApplicationController
  def create
  @comment = Comment.new(params[:comment])
  @post = @comment.post
    if @comment.save
      flash[:notice] = "Comment is awaiting moderation"
      redirect_to @post
    else
      render template: "posts/show"
    end
  end
end
