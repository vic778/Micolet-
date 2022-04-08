class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.newsletter_confirmation(@user).deliver_now
      redirect_to root_path, notice: "Email sent! Thank you for subscribing to our newsletter! :)"
    else
      redirect_to root_path
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, preferences: [])
  end
end
