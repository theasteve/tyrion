# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validate :full_name
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :stock_transactions
  has_many :stocks, through: :stock_transactions
end
