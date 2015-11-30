class Movie < ActiveRecord::Base
  has_many :listings
  has_many :lists, through: :listings

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :notes


  # def tag_list=(names, user)
  #   self.tags_by_user = names.split(",").map do |n|
  #     Tag.by_user(user).where(name: n.strip).first_or_create!
  #   end
  # end

  def taggerd(names, user)
    names.split(",").map do |n|
      @tag = Tag.by_user(user).find_by_name(n.strip.gsub(' ','-'))
      self.tags << @tag
    end
  end

  def self.tagged_with(name, user)
    Tag.by_user(user).find_by_name!(name).movies
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

end
