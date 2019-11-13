class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  validates :price, presence: true
  validates :date, presence: true
end
