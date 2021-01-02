class SessionsController < ApplicationController
  include ActionController::Cookies
  include CurrentUserConcern

  def create
    user = User.from_omniauth(session_params)

    if user
      session[:user_id] = user.id
      cookies[:logged_in] = { value: true, expires: 30.days }
      redirect_to "/westeros/top-stocks"
    else
      render json: { status: 401 }
    end
  end

  def logout
    reset_session
    cookies[:logged_in] = { value: false }
    render json: { status: 200, logged_out: true }
  end

  def redirect_on_error
    redirect_to "/westeros/top-stocks"
  end

  def session_params
    auth = request.env["omniauth.auth"]
    params = auth.slice("provider", "uid", "name")
    params.name = auth.dig(:info, :name)
    params.image_url = auth.dig(:extra, :raw_info, :subreddit, :icon_img).split('?').first
    params = ActionController::Parameters.new(params).permit!
  end
end
