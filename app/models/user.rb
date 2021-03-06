class User < ApplicationRecord
  include Discard::Model
  has_secure_password

  validates :email,
    presence: true,
    uniqueness: true
end
