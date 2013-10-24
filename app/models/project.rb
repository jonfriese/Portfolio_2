class Project < ActiveRecord::Base
  attr_accessible :name, :technologies_used, :published
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  validates :name, length: { in: 4..255 }
  validates :technologies_used, presence: true
  scope :published, where(published: true)

  def publish!
    self.published = true
    save!
  end

  def authored_by?(user)
    author == user
  end
end
