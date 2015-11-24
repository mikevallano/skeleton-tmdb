class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists
  has_many :listings, through: :lists

  has_many :movies, through: :listings

  has_many :memberships
  has_many :member_lists, :through => :memberships,
  :source => :list

  has_many :member_movies, :through => :member_lists,
  :source => :movies

end
