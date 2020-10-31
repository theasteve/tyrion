# frozen_string_literal: true

class LiveStream < ApplicationRecord
  belongs_to :topic

  validate :start_date_time

  has_many :live_stream_attendees
  has_many :attendees, through: :live_stream_attendees
end

