class User < ApplicationRecord

    has_many :books
    has_many :cars

    validates :name, presence: true, uniqueness: {case_sensitive: false}, 
                length: {minimum: 3, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
    uniqueness: { case_sensitive: false }, 
    length: { maximum: 105 },
    format: { with: VALID_EMAIL_REGEX }
end
