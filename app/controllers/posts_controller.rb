class PostsController < ApplicationController
  before_filter :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @commentable = @post
    @comments = @commentable.comments
    @comments = policy_scope(Comment)
    @comment = Comment.new
    render :layout => "post_show"
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    render :layout => "post_create"
  end

  # GET /posts/1/edit
  def edit
    render :layout => "post_edit"
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        current_user.posts << @post
        format.html { redirect_to @post }
      else
        format.html { redirect_to @post }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to "/" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to "/"
  end

private
  def set_post
    @post = Post.find(params[:id])
  end
end
