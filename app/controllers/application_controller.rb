class ApplicationController < ActionController::Base
  # Set  condition before to change the language
  before_action :set_locale

  private

  # provider a loccal parms into the UrlLink
  def default_url_options
    { locale: I18n.locale }
  end

  # check if the local ilscorrect
  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  # check if the if the locl is supported or not
  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end
end
