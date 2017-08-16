OmniAuth.config.logger = Rails.logger

Rails.application.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
end 
  
end