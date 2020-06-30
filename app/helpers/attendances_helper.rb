module AttendancesHelper
  def attn_with_group
    Attendance.includes(:group).where.not(group: nil).where(author: current_user.id)
  end

  def attn_without_group
    Attendance.includes(:group).where(group: nil, author: current_user.id)
  end
end
