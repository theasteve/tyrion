class SessionsController < ApplicationController
  include ActionController::Cookies
  include CurrentUserConcern

  def create
    user = User.find_by(email: params["email"]).try(:authenticate, params["password"])
    if user
      session[:user_id] = user.id
      cookies[:logged_in] = { value: true, expires: 30.days }
      render json: { status: :created, logged_in: true, user: UserSerializer.new(user) }
    else
      render json: { status: 401 }
    end
  end

  def logout
    reset_session
    cookies[:logged_in] = { value: false }
    render json: { status: 200, logged_out: true }
  end
end
