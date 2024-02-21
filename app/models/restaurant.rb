class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  VALID_CATEGORIES = %w[chinese italian japanese french belgian].freeze

  validates :name, :address, :category, :phone_number, presence: true
  validates :category, inclusion: { in: VALID_CATEGORIES, message: '%<value>s is not a valid category' }
end
