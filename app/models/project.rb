class Project < ActiveRecord::Base
  attr_accessible :name, :technologies_used
  validates :name, length: { in: 4..255 }
  validates :technologies_used, presence: true
end
