module GroupsHelper
  def group_alphabetical_order
    Group.order('lower(name) ASC').all
  end

  def group_user_name(user_id)
    User.find_by_id(user_id).name
  end

  def group_avatar(group)
    if group.group_avatar.attached?
      image_tag group.group_avatar, class: 'group-avatar d-block border'
    else
      image_tag 'default_group_avatar.png', class: 'group-avatar d-block border'
    end
  end

  def group_has_attn(group)
    attn = Attendance.includes(:group).where(group_id: group.id).order(created_at: :desc)
    attn
  end
end
