module GroupsHelper
  def group_alphabetical_order
    Group.order('lower(name) ASC').all
  end

  def group_user_name(user_id)
    User.find_by_id(user_id).name
  end

  def group_avatar(group)
    if group.group_avatar.attached?
      image_tag group.group_avatar.variant(resize: '100x100')
    else
      image_tag 'default_group_avatar.png', size: '100x100'
    end
  end
end
