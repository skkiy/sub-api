class Subscription < ApplicationRecord
  belongs_to :user
  enum payment_interval_statuses: { month: 'month', year: 'year' }

  validates :name, presence: true, length: { maximum: 100 }
  validates :price, presence: true
  validates :description, length: { maximum: 1000 }
  validates :payment_date, presence: true
  validates :payment_interval_status, inclusion: { in: self.payment_interval_statuses.keys }
  validates :user_id, presence: true
end
