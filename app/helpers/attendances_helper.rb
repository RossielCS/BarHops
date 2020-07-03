module AttendancesHelper
  def attn_with_group
    Attendance.includes(:group).where.not(group: nil).where(author: current_user.id).order(created_at: :desc)
  end

  def attn_without_group
    Attendance.includes(:group).where(group: nil, author: current_user.id).order(created_at: :desc)
  end

  def attn_group(group_id)
    image = Group.where(id: group_id).first
    image_tag image.group_avatar, class: 'group-avatar border' if image.group_avatar.attached?
  end

  def total_attn(attendances)
    total = 0
    attendances.each { |a| total += a.amount }
    total
  end
end
