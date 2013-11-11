class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  before_filter :get_posts

  protected

  def get_posts
    @posts ||= Post.all
  end
end
