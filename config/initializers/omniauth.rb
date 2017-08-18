OmniAuth.config.logger = Rails.logger

if Rails.env == 'development' || Rails.env == 'test'
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'],
    scope: 'email', info_fields: 'email,first_name,last_name', display: 'popup', provider_ignores_state: true
  end
else
  # Production
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'],
    scope: 'email', info_fields: 'email,first_name,last_name', display: 'popup', provider_ignores_state: true
  end
end
