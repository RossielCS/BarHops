module AttendancesHelper
  def attn_with_group
    Attendance.includes(:group).where.not(group: nil).where(author: current_user.id).order(created_at: :desc)
  end

  def attn_without_group
    Attendance.includes(:group).where(group: nil, author: current_user.id).order(created_at: :desc)
  end

  def attn_group(group_id)
    image = Group.where(id: group_id).first.group_avatar
    image_tag image.variant(resize: '100x100')
  end
end
