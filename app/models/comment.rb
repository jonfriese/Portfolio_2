class Comment < ActiveRecord::Base
  attr_accessible :author, :author_email,
                  :author_url, :content, :referrer,
                  :user_agent, :user_ip, :post_id,
                  :commentable_id, :commentable_type

  belongs_to :commentable, polymorphic: true
end
