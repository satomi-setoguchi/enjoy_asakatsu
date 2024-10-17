class Post < ApplicationRecord
  belongs_to :user
  belongs_to :record
  has_many :comments, dependent: :destroy

  mount_uploader :image, PostImageUploader

  validates :body, length: { maximum: 65_535 }

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "record_id", "updated_at", "user_id"]
    end
    
end
