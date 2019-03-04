class Customer < ApplicationRecord
  belongs_to :merchant
  has_many :feedbacks
  has_many :feedback_forms, through: :feedbacks

  def name
    first_name + ' ' + last_name
  end
end
