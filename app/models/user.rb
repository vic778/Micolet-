class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { alert: 'Email already exists!' }
  validates :preferences, presence: true

  before_save do
    preferences.gsub!(/[\[\]"]/, '') if attribute_present?('preferences')
  end
end
