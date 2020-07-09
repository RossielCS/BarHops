module GroupsHelper
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
end
