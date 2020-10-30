# frozen_string_literal: true

##############################################################
# Live Stream Attendee model
##############################################################
class LiveStreamAttendee
 belongs_to :question
 belongs_to :live_stream
end

