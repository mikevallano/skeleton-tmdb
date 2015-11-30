class Tag < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :movies, through: :taggings

  scope :by_user, lambda { |user| where(:user_id => user.id) }
end
