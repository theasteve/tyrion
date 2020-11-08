class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user).serializable_hash, status: 201
    else
      render json: user.errors.details
    end
  end

  private

  def user_params
    params.require(:data).require(:attributes).permit(:email, :password, :password_confirmation)
  end
end
