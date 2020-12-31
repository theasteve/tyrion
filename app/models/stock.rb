# frozen_string_literal: true

class Stock < ApplicationRecord
  include PgSearch::Model

  #https://pganalyze.com/blog/full-text-search-ruby-rails-postgres
  pg_search_scope :search,
                  against: { ticker: 'A', name: 'B' },
                  using: { 
                    tsearch: { prefix: true, dictionary: 'english', tsvector_column: 'searchable' } 
                  }


  has_many :stock_transactions
  has_many :users, through: :stock_transactions

  validates_uniqueness_of :ticker
  validates :name, presence: true
end


