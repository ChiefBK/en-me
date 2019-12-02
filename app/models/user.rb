class User < ApplicationRecord
  has_many :invites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :event_reminders, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :phones, dependent: :destroy

  validates :display_name,
    uniqueness: { message: "The display name specified is already in use" },
    unless: ->(user) { user.display_name.nil? }
  validates :first_name, presence: { message: "A first name is required" }
  validates :last_name, presence: { message: "A last name is required" }
  validates :email,
    presence: { message: "An email or a phone number is required" },
    unless: ->(user) { user.phones.present? },
    uniqueness: { message: "The email specified is already in use" },
    format: { with: /\w+@\w+\.\w+/, message: "The email specified is invalid" }
  validates :phones,
    presence: { message: "An email or a phone number is required" },
    unless: ->(user) { user.email.present? }

  def self.find_by_phone_number(phone_number)
    self.joins(:phones).find_by(phones: { phone_number: phone_number})
  end

  def phone_numbers
    self.phones.map { |phone| phone.phone_number }
  end
end
