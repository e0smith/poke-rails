class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true
  validates :password, confirmation: { case_sensitive: true }

  has_many :teams
end
