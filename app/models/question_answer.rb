class QuestionAnswer < ApplicationRecord
  belongs_to :question, inverse_of: :question_answers
  belongs_to :merchant

  def rating_values
    (1..rating).to_a
  end
end
