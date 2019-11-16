class User < ApplicationRecord
  has_many :invites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :event_reminders, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :phones, dependent: :destroy

  # validates :display_name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, unless: ->(user){user.phones.present?}
  validates :phones, presence: true, unless: ->(user){user.email.present?}
end
