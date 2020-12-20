# frozen_string_literal: true

class Stock < ApplicationRecord
  has_many :stock_transactions
  has_many :users, through: :stock_transactions

  validates_uniqueness_of :ticker
  validates :name, presence: true
end


