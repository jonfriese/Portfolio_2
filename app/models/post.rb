class Post < ActiveRecord::Base
  attr_accessible :body, :title, :published,
                  :author_id, :image, :remote_image_url
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  validates :title, length: { in: 4..255 }
  scope :published, where(published: true)
  translates :name, :content

  def authored_by?(user)
    author == user
  end
end
