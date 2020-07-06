class Attendance < ApplicationRecord
  validates :name, length: { in: 4..30 }, uniqueness: { case_sensitive: false }
  validates :amount, numericality: { only_integer: true }

  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true

  def self.attn_with_group(current_user)
    Attendance.includes(:group).where.not(group: nil).where(author: current_user.id).order(created_at: :desc)
  end

  def self.attn_without_group(current_user)
    Attendance.includes(:group).where(group: nil, author: current_user.id).order(created_at: :desc)
  end

  def self.group_has_attn(group)
    attn = Attendance.includes(:group).where(group_id: group.id).order(created_at: :desc)
    attn
  end
end
