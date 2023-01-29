class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_people, presence: true, numericality: {only_integer: true, greater_than: 0}

  validate :date_before_start
  validate :date_before_end



  def date_before_start
    if start_date.present? && end_date.present? && start_date < Date.today
      errors.add(:start_date, "は今日以降のものを選択してください") if start_date < Date.today     
    end
  end

  def date_before_end
    if start_date.present? && end_date.present? && start_date >= end_date
      errors.add(:end_date, "は開始日以降のものを選択してください") if end_date < start_date
    end
  end
end