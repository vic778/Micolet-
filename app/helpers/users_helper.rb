module UsersHelper
  # am checking if the box is selected by the user or not
  def checked(area)
    @user.preferences.nil? ? false : @user.preferences.match(area)
  end
end
