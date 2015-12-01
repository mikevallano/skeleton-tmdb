class Movie < ActiveRecord::Base
  has_many :listings
  has_many :lists, through: :listings

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :notes


  def taggerd(names, user)
    names.split(",").map do |n|
      @tag = Tag.by_user(user).find_by_name(n.strip.gsub(' ','-'))
      if !self.tags.include?(@tag)
        self.tags << @tag
      end
    end
  end

  def self.group_tagged_with(name, list)
    Tag.by_list(list).find_by_name!(name).movies
  end

  def self.tagged_with(name, user)
    Tag.by_user(user).find_by_name!(name).movies
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

end
