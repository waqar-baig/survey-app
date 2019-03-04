class FeedbackForm < ApplicationRecord
  belongs_to :merchant
  has_many :feedback_forms_questions
  has_many :questions, through: :feedback_forms_questions
  has_many :feedbacks
  has_many :customers, through: :feedbacks

  enum status: {inactive: 0, active: 1 }
end
