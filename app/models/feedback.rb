class Feedback < ApplicationRecord
  belongs_to :feedback_form
  belongs_to :customer
  belongs_to :merchant
  has_many :questions, through: :feedback_form
  has_many :feedback_answers, inverse_of: :feedback

  enum status: { sent: 1, completed: 2}
  after_commit :invite_customer, on: :create
  accepts_nested_attributes_for :feedback_answers, reject_if: proc {|answer| answer[:rating].blank? && answer[:value].blank? }, allow_destroy: true

  scope :recent_first, -> { order("created_at desc") }

  def invite_customer
    FeedbackMailer.invite(customer, feedback_form, self).deliver_now
  end

  def mark_complete!
    completed!
    update_attribute(:completed_at, DateTime.now)
  end
end
