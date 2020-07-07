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
    Attendance.includes(:group).where(group_id: group.id).order(created_at: :desc)
  end

  def self.current_user_groups_id(current_user_id)
    groups = Attendance.joins(:group).select(:group_id).where(author_id: current_user_id).group(:group_id)
    groups_id = []
    groups.each { |g| groups_id << g.group_id }
    groups_id
  end

  def self.friends_name(current_user, other_users)
    g_id = Attendance.current_user_groups_id(current_user.id)
    Attendance.joins(:author).select(:author_id, 'users.name').where(group_id: g_id, author: other_users.ids)
      .group(:author_id, 'users.name')
  end
end
