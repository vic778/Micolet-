require 'net/http'
require 'net/https'

class UsersController < ApplicationController

  def make_abstract_request(user)
    uri = URI('https://emailvalidation.abstractapi.com/v1/?api_key=e9eb98186dba4019b6cf0c1f68fee5d8&email=' + user)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request =  Net::HTTP::Get.new(uri)

    response = http.request(request)
    puts "Status code: #{ response.code }"
    puts "Response body: #{ response.body }"
    rescue StandardError => error
    puts "Error (#{ error.message })"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.newsletter_confirmation(@user).deliver_now
      redirect_to root_path, notice: 'Email sent! Thank you for subscribing to our newsletter! :)'
    else
      redirect_to root_path, alert: 'Email ready taken or email can not be blanck and the preferences should be selected!'
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, preferences: [])
  end
end
