module GroupsHelper
  def group_alphabetical_order
    Group.order('lower(name) ASC').all
  end

  def group_user_name(user_id)
    User.find_by_id(user_id).name
  end
end
