class FeedbackMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.feedback_mailer.invite.subject
  #
  def invite customer, feedback_form, feedback
    @customer = customer
    @feedback_form = feedback_form
    @feedback = feedback

    mail to: customer.email, subject: 'New feedback form'
  end
end
