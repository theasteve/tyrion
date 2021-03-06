Rails.application.config.middleware.use OmniAuth::Builder do
  provider :reddit, ENV['REDDIT_ID'], ENV['REDDIT_SECRET'], { provider_ignores_state: true, scope: "identity"}
end

OmniAuth.config.on_failure = SessionsController.action(:redirect_on_error)