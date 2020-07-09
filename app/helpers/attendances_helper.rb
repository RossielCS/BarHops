module AttendancesHelper
  def attn_group(group_id)
    # rubocop:disable Style/GuardClause
    if group_id
      image = Group.where(id: group_id).first
      if image.group_avatar.attached?
        image_tag image.group_avatar, class: 'group-avatar border'
      else
        image_tag 'default_group_avatar.png', class: 'group-avatar d-block border'
      end
    end
    # rubocop:enable Style/GuardClause
  end

  def total_attn(attendances)
    total = 0
    attendances.each { |a| total += a.amount }
    total
  end
end
