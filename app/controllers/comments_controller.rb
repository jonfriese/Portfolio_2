class CommentsController < ApplicationController
  before_filter :load_commentable, :comment


  def create
    if @comment.save
      redirect_to @commentable, notice: "Comment is awaiting moderation."
    else
      instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
    end
  end

  def destroy
    authorize @comment
    @comment.destroy
    redirect_to @commentable
  end

  def update
    authorize @comment
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @commentable, notice: 'Post has been approved.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


private

  def load_commentable
    @resource, id = request.path.split('/')[1,2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end

  def comment
    @comment = @commentable.comments.new(params[:comment])
  end
end
