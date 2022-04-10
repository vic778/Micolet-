Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['979704183053-jca5r4ho9g3k8gfvmqdc4ot3qso90lom.apps.googleusercontent.com'], ENV['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'],
    {
      scope: 'userinfo.email, userinfo.profile, http://gdata.youtube.com',
      prompt: 'select_account',
      image_aspect_ratio: 'square',
      image_size: 50
    }
end