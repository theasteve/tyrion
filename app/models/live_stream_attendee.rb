# frozen_string_literal: true

class LiveStreamAttendee < ApplicationRecord
  belongs_to :question
  belongs_to :live_stream
end

