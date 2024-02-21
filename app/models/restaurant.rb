class Restaurant < ApplicationRecord
  validates :name, :address, :category, :phone_number, presence: true
end
