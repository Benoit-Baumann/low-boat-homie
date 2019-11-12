class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  validates :price, presence: true
  validates :date, presence: true
  validates :date_format, :date_cannot_be_in_the_past

  def date_format
    :date.match('/\d{2}\/\d{2}\/\d{4}/')
  end

  def date_cannot_be_in_the_past
    if :date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
end
