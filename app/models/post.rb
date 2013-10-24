class Post < ActiveRecord::Base
  attr_accessible :body, :title, :published, :author_id
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  validates :title, length: { in: 4..255 }
  validates :body, presence: true
  scope :published, where(published: true)

  def publish!
    self.published = true
    save!
  end

  def authored_by?(user)
    author == user
  end
end
