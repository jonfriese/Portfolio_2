class CommentsController < ApplicationController
  before_filter :load_commentable

  def create
    @comment = @commentable.comments.new(params[:comment])
    if @comment.save
      redirect_to @commentable
    else
      instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to @commentable, notice: 'Comment has been destroyed.'
  end

  def update
    @comment = @commentable.comments.find(params[:id])
    authorize @comment

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @commentable, notice: 'Comment has been approved.' }
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
end
