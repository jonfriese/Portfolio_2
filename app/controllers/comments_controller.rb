class CommentsController < ApplicationController
  def create
  @comment = Comment.new(comment_params)
  @post = @comment.post
    if @comment.save
      flash[:notice] = "Comment is awaiting moderation"
      redirect_to @post
    else
      render template: "posts/show"
    end
  end
end
