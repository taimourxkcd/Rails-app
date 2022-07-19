class Article < ApplicationRecord


   belongs_to :user, dependent: :destroy
  
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
  end
  