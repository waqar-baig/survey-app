class FeedbackFormsQuestion < ApplicationRecord
  belongs_to :feedback_form
  belongs_to :question
end
