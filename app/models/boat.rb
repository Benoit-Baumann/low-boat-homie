class Boat < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  mount_uploader :photo, PhotoUploader
  
  belongs_to :owner, class_name: 'User'
  has_many :reviews
  has_many :rentals
  validates :name, presence: true
  validates :location, presence: true
  validates :description, length: { in: 10..1000 }
  validates :category, presence: true
end
