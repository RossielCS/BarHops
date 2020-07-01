module UsersHelper
  def user_avatar(user)
    if user.user_avatar.attached?
      image_tag user.user_avatar.variant(resize: '100x100')
    else
      image_tag 'default_user_avatar.png', size: '100x100'
    end
  end
end
