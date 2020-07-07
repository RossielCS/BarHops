class User < ApplicationRecord
  validates :name, length: { in: 4..25 }, uniqueness: { case_sensitive: false }

  has_many :attendances, foreign_key: 'author_id', dependent: :destroy
  has_many :groups, dependent: :destroy
  has_one_attached :user_avatar

  def self.not_current_user_list(current_user)
    User.where.not(id: current_user.id)
  end
end
