class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  # before_action :random_avatar, if: :photo_present?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :boats, foreign_key: :owner_id
  has_many :rentals
  mount_uploader :photo, PhotoUploader

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  private

  def photo_present?
    :photo.nil?
  end

  def self.random_avatar
    puts Dir["#{Rails.root.to_s}/app/assets/images/avatars/*"]
  end
end
