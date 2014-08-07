Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  OmniAuth.config.on_failure = HomepageController.action(:index)
  provider :google_oauth2, 
                    ENV['GOOGLE_CLIENT_KEY'], ENV['GOOGLE_CLIENT_SECRET'], { 
                    access_type: "offline", 
                    scope: 'https://www.googleapis.com/auth/userinfo.email' 
                  }
end