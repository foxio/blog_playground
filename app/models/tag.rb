class Tag < ActiveRecord::Base
  validates :name, presence: true
  has_many :taggings
  has_many :articles, through: :taggings

end
