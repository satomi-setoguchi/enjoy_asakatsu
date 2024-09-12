class Post < ApplicationRecord
  belongs_to :user
  belongs_to :record

  mount_uploader :image, PostImageUploader

  validates :body, length: { maximum: 65_535 }
end
