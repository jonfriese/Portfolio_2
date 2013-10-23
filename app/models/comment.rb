class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :commentable, polymorphic: true
  attr_accessible :approved, :author, :author_email, :author_url,
  :content, :referrer, :user_agent, :user_ip, :post_id, :commentable_id, :commentable_type
end
