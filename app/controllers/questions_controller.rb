class QuestionsController < ApplicationController
  before_action :set_feedback_form
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @feedback_form = FeedbackForm.find(params[:feedback_form_id])
    @question = Question.new
    @question.question_type = 'rating'
    @question.question_answers.build
  end

  # GET /questions/1/edit
  def edit
    @question.question_answers.build if @question.question_answers.count == 0
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.merchant_id = current_merchant.id
    @question.feedback_form = @feedback_form
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.js   { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to [@feedback_form, @question], notice: 'Question was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.js   { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.js
      format.json { head :no_content }
    end
  end

  private
    def set_feedback_form
      @feedback_form = FeedbackForm.find(params[:feedback_form_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :question_type, :is_required, :merchant_id, question_answers_attributes: [:id, :rating, :answer_label, :merchant_id, :_destroy])
    end
end
