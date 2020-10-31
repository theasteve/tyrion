# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  validate :time
end

