require 'open-uri'

class WesterosController < ActionController::Base
  include ActionView::Layouts
  include ActionController::Rendering
  include ReverseProxy::Controller if Rails.env.development?

  def index
    if Rails.env.production?
      url_response = URI.open(ENV['S3_EMBER_APP']).read
      render html: url_response.html_safe
    else
      reverse_proxy 'http://localhost:4200'
    end
  end
end
