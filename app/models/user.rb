class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists, :foreign_key => "owner_id"
  has_many :listings, through: :lists

  has_many :movies, through: :listings

  has_many :memberships, :foreign_key => "member_id"
  has_many :member_lists, :through => :memberships,
  :source => :list

  has_many :member_movies, :through => :member_lists,
  :source => :movies

  has_many :tags
  has_many :tagged_movies, :through => :tags,
  :source => :user

  has_many :notes
  has_many :watched_movies, :through => :notes,
  :source => :movie

  def uniq_tags(names)
    self.tags.uniq << names.split(",").map do |t|
      Tag.by_user(self).where(name: t.strip.gsub(' ','-')).first_or_create!
    end
  end

  def all_lists
    (self.lists | self.member_lists).uniq
  end

end
