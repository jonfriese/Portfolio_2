module ApplicationHelper

 # translate the rails flash levels to appropriate twitter bootstrap css classes def flash_class(level)
 def flash_class(level)
  case level
   when :notice then "alert alert-info"
   when :success then "alert alert-success"
   when :error then "alert alert-error"
   when :alert then "alert alert-error"
  end
 end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    devise_mapping.to
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def me?
    user_signed_in? && current_user.name = "JonFriese33"
  end
end

