class User < ApplicationRecord
  # devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  # relation
  has_many :subscriptions, dependent: :destroy

  # validation
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: true }

  before_create :generate_uuid
end
