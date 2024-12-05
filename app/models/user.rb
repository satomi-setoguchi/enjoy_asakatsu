class User < ApplicationRecord
  has_many :records, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followee_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followee
  has_many :followers, through: :passive_relationships, source: :follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX },on: :create

  def own?(object)
    object.user_id == id
  end

  def follow(user)
    followings << user
  end

  def unfollow(user)
    followings.destroy(user)
  end

  def following?(user)
    followings.include?(user)
  end
end
