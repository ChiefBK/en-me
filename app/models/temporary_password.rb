class TemporaryPassword < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :password, presence: true

  def self.temporary_password_for_user(user)
    self.where(user: user).order(created_at: :desc).first
  end
end