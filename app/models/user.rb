class User < ApplicationRecord
  has_one_attached :image

  with_options dependent: :destroy do 
    has_many :posts
    has_many :comments
    has_many :likes
    has_many :bookmarks
    has_many :notifications, as: :recipient
  end

  followability

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable


  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end

  def name
    email.split('@')[0].capitalize!
  end
end
