class List < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"

  has_many :listings
  has_many :movies, through: :listings

  has_many :memberships
  has_many :members, through: :memberships

  scope :by_user, lambda { |user| where(:user_id => user.id) }

end
