class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  before_filter :set_locale
  before_filter :get_posts

  protected

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end

  def get_posts
    @posts ||= Post.all
  end
end
