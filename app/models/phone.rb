class Phone < ApplicationRecord
  belongs_to :user
  has_many :sms_messages

  validates :user, presence: true
  validates :is_primary, presence: true
  validates :phone_number,
            format:     { with: /\d{10}/, message: "The phone number specified is invalid" },
            length:     { is: 10, message: "The phone number specified must be 10 characters long" },
            uniqueness: { message: "The phone number specified is already in use" },
            presence:   { message: "You must specify a phone number" }
end
