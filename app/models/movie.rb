class Movie < ActiveRecord::Base
  has_many :listings
  has_many :lists, through: :listings

end
