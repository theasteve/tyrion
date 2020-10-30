# frozen_string_literal: true

##############################################################
# Live Stream model
##############################################################
class LiveStream
  belongs_to :topic

  validate :start_date_time

  has_many :live_stream_attendees
  has_many :attendees, through: :live_stream_attendees
end

