class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true
  validates :email, presence: true,length: { maximun:50 },
                        format: {with: VALID_EMAIL_REGEX},
                        uniqueness: {case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
end
