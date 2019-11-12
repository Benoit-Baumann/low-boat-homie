class Boat < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :reviews
  has_many :rentals
  validates :name, presence: true
  validates :location, presence: true
  validates :description, length: { in: 25..1000 }
  validates :type, presence: true
end