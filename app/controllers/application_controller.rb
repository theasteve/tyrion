class ApplicationController < ActionController::API
  #for api only csrf token is not needed
  #skip_before_action :verify_authenticity_token

  def tracker
    @tracker ||= Mixpanel::Tracker.new(ENV['MIXPANEL_PROJECT_TOKEN'])
  end
end
