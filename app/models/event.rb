class Event < ApplicationRecord

  belongs_to :user
  has_many :participants
  has_many :users, through: :attendances

  validates :start_date, presence: true
  validates :duration, presence: true
  validates :title, presence: true, length: {in: 5..140}
  validates :description, presence: true, length: {in: 20..1000}
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 1001}
  validates :location, presence: true



  def date(start_date)
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "date not available")
    end
  end

  def time(duration)

    if (duration % 5) != 0
      errors.add(:duration, "duration not available")
    end
  end


end
