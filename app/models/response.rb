# frozen_string_literal: true

class Response < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  validate :date
end

