class List < ActiveRecord::Base
  belongs_to :user

  has_many :listings
  has_many :movies, through: :listings

  has_many :memberships

end
