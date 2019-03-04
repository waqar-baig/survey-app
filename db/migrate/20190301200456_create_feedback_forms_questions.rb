class CreateFeedbackFormsQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :feedback_forms_questions do |t|
      t.references :feedback_form, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
