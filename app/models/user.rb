class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  before_save :set_random_avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :boats, foreign_key: :owner_id#, dependent: :destroy
  has_many :rentals#, dependent: :destroy
  has_many :reviews#, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  private

  def set_random_avatar
    unless photo?
      avatar_url = Dir["#{Rails.root}/app/assets/images/avatars/*"].sample
      self.photo = Pathname.new(Rails.root.join(avatar_url)).open
      save
    end
  end
end
