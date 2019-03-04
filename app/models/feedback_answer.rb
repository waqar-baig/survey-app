class FeedbackAnswer < ApplicationRecord
  belongs_to :feedback, inverse_of: :feedback_answers
  belongs_to :question

  def question_answer
    question.question_answers.where(id: value.to_i).first
  end
end
