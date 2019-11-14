class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  # before_save :set_random_avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :boats, foreign_key: :owner_id
  has_many :rentals
  mount_uploader :photo, PhotoUploader

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def set_random_avatar
    puts 'coucou'
    unless photo?
      puts 'hello'
      avatar_url = Dir["#{Rails.root}/app/assets/images/avatars/*"].sample
      photo = Rails.root.join(avatar_url)
      save
    end
  end
end
