module UsersHelper
  def user_avatar(user)
    if user.user_avatar.attached?
      image_tag user.user_avatar, class: 'avatar'
    else
      image_tag 'default_user_avatar.png', class: 'avatar'
    end
  end
end
