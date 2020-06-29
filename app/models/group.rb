class Group < ApplicationRecord
  validates :name, length: { in: 4..20 }, uniqueness: { case_sensitive: false }

  belongs_to :user
  has_many :attendances
end
