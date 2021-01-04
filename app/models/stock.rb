# frozen_string_literal: true

class Stock < ApplicationRecord
  include PgSearch::Model

  #https://pganalyze.com/blog/full-text-search-ruby-rails-postgres
  pg_search_scope :search,
                  against: :ticker,
                  using: { 
                    tsearch: { prefix: true, dictionary: 'simple', tsvector_column: 'searchable' } 
                  }

  has_many :stock_transactions
  has_many :users, through: :stock_transactions

  validates_uniqueness_of :ticker
  validates :name, presence: true

  validates :following, numericality: { greater_than_or_equal_to: 0 }
  validates :buying, numericality: { greater_than_or_equal_to: 0 }
  validates :selling, numericality: { greater_than_or_equal_to: 0 }
  validates :holding, numericality: { greater_than_or_equal_to: 0 }
end


