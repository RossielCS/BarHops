class User < ApplicationRecord
  validates :name, length: { in: 4..25 }, uniqueness: { case_sensitive: false }

  has_many :attendances, foreign_key: 'author_id'
  has_many :groups
  has_one_attached :user_avatar
end
