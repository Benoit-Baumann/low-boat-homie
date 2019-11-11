class Boat < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :reviews
  has_many :rentals
end
