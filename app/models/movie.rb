class Movie < ActiveRecord::Base
  has_many :listings
  has_many :lists, through: :listings

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :notes

end
