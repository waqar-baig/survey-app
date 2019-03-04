class CreateQuestionAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :question_answers do |t|
      t.references :question, foreign_key: true
      t.integer :rating
      t.string :answer_label
      t.references :merchant, foreign_key: true

      t.timestamps
    end
  end
end
