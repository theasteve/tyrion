# frozen_string_literal: true

##############################################################
# Answer Model
##############################################################
class Answer
  belongs_to :topic
  belongs_to :user

  validate :time
end

