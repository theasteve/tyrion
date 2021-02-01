class UsersController < ApplicationController
  include CurrentUserConcern

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: UserSerializer.new(user).serializable_hash, status: 201
    else
      render json: user.errors.details
    end
  end

  def index
    if params[:me]
      render json: UserSerializer.new(@current_user).serializable_hash, status: 200
    else
      render status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:data).require(:attributes).permit(:email, :password, :password_confirmation)
  end
end
