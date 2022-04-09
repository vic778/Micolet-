class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :preferences, presence: true

  before_save do
    preferences.gsub!(/[\[\]"]/, '') if attribute_present?('preferences')
  end
end
