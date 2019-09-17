class Location < ApplicationRecord
  validates :address_line_one, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :name, presence: true
end
