class User < ApplicationRecord
  validates :name, length: { in: 4..25 }, uniqueness: { case_sensitive: false }

  has_many :attendances, foreign_key: 'author_id', dependent: :destroy
  has_many :groups, dependent: :destroy
  has_one_attached :user_avatar
end
