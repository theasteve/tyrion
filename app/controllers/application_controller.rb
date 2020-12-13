class ApplicationController < ActionController::API
  #for api only csrf token is not needed
  #skip_before_action :verify_authenticity_token
end
