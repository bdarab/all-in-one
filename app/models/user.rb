class User < ApplicationRecord

  has_many :chatroom
  has_many :messages

  validates :username, presence: true, length: {minimum: 3, maximum: 30},
            uniqueness: {casesensetive: false}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum:105 },
              uniqueness: { case_sensitive: false },
              format: {with: VALID_EMAIL_REGEX}
              
  has_secure_password

end