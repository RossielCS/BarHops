class Group < ApplicationRecord
  validates :name, length: { in: 4..40 }, uniqueness: { case_sensitive: false }

  belongs_to :user
  has_many :attendances
  has_one_attached :group_avatar
end
