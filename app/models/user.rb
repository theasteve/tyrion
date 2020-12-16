# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validate :full_name
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :topics, foreign_key: :user_id

  has_many :votes
  has_many :topics_voted, through: :votes

  has_many :live_stream_attendees
  has_many :live_streams_attended, through: :live_streams_attendees

  has_many :responses
end
