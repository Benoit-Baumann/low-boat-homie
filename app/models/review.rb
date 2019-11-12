class Review < ApplicationRecord
  belongs_to :boat
  belongs_to :user
  validates :description, presence: true
end
