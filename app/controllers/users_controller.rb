class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Saved succeffully'
    else
      redirect_to root_path, alert: 'Failed to save'
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, preferences: [])
  end
end
