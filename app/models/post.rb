class Post < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "title", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  has_many_attached :images
  belongs_to :user

  with_options dependent: :destroy do
    has_many :comments
    has_many :likes
  end

  validates :title, presence: true
  validate :validate_image_format

  private

  def validate_image_format
    images.each do |image|
      unless image.blob.content_type.in?(%w[image/jpeg image/png])
        errors.add(:images, 'must be a JPEG or PNG image')
      end
    end
  end
end
