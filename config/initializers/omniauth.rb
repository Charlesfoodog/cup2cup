Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  OmniAuth.config.on_failure = HomepageController.action(:index)
end