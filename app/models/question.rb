class Question < ApplicationRecord
  belongs_to :merchant
  has_many :question_answers, inverse_of: :question, dependent: :destroy
  has_one :feedback_forms_question, dependent: :destroy
  has_one :feedback_form, through: :feedback_forms_question

  enum question_type: {rating: 1, multiple_choice: 2, open_ended: 3}
  accepts_nested_attributes_for :question_answers, reject_if: :all_blank, allow_destroy: true
end
