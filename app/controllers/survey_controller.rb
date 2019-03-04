class SurveyController < ApplicationController
  skip_before_action :authenticate_merchant!
  before_action :set_feedback, except: :completed
  before_action :skip_survey, except: :completed

  def show
    @feedback.questions.each do |question|
      @feedback.feedback_answers.build(question: question)
    end
  end

  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        @feedback.mark_complete!
        format.html { render 'success'}
      else
        format.html { render @feedback.errors}
      end
    end
  end

  private
  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    process_params!
    params.require(:feedback).permit(
      feedback_answers_attributes: [:question_id, :feedback_id, :rating, :value])
  end

  def process_params!
    _params = params[:feedback]
    feedback_answers = []
    _params[:feedback_answers_attributes].each_pair do |index, feedback_answer|
      if feedback_answer[:value].is_a?(Array)
        feedback_answers << feedback_answer[:value].map do |v|
          new_attrs = feedback_answer.dup
          new_attrs[:value] = v
          new_attrs
        end
        feedback_answer[:value] = []
      end
    end
    index = _params[:feedback_answers_attributes].keys.last.to_i
    feedback_answers.flatten.each do |answer|
      index += 1
      _params[:feedback_answers_attributes][index.to_s] = answer
    end
  end

  def skip_survey
    if @feedback.completed?
      redirect_to :completed
    end
  end
end
