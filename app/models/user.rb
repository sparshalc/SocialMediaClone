class User < ApplicationRecord
  has_one_attached :image
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


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
