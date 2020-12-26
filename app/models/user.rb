class User < ApplicationRecord
  has_many :stock_transactions
  has_many :stocks, through: :stock_transactions

  def self.from_omniauth(params)
    where(uid: params["uid"], provider: params["provider"]).first || create_from_omniauth(params)
  end

  def self.create_from_omniauth(params)
    User.create(params)
  end
end
