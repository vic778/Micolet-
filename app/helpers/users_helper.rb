module UsersHelper
  def checked(area)
    @user.preferences.nil? ? false : @user.preferences.match(area)
  end
end
