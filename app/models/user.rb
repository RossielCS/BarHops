class User < ApplicationRecord
  validates :name, length: { in: 4..20 }, uniqueness: { case_sensitive: false }

  has_many :attendances, foreign_key: 'author_id'
  has_many :groups
end
