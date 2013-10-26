class Comment < ActiveRecord::Base
  attr_accessible :approved, :author, :author_email,
                  :author_url, :content, :referrer,
                  :user_agent, :user_ip, :post_id,
                  :commentable_id, :commentable_type

  belongs_to :commentable, polymorphic: true
  scope :approved, where(approved: true)

  def approved!
    self.approved = true
    save!
  end

  def authored_by?(user)
    author == user
  end
end
