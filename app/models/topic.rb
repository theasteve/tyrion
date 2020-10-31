# frozen_string_literal: true

class Topic < ApplicationRecord
  belongs_to :user

  has_one :live_stream

  has_many :votes
  has_many :up_votes, through: :votes

  validate :title, :description
end

