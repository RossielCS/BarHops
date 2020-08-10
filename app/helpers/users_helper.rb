module UsersHelper
  def user_avatar(user)
    u = user
    u = User.find_by_id(user) unless user.is_a? User
    if u.user_avatar.attached?
      image_tag u.user_avatar
    else
      image_tag 'default_user_avatar.png', class: 'avatar'
    end
  end
end
