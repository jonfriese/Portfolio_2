class Post < ActiveRecord::Base
  attr_accessible :body, :title, :published
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  scope :published, where(published: true)

  def publish!
    self.published = true
    save!
  end

  def authored_by?(user)
    author == user
  end
end
