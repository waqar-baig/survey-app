class CreateFeedbackAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :feedback_answers do |t|
      t.references :feedback, foreign_key: true
      t.references :question, foreign_key: true
      t.integer :rating
      t.text :value

      t.timestamps
    end
  end
end
