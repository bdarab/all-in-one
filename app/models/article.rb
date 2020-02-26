class Article < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :content, presence: true, length: {minimum: 5}

end