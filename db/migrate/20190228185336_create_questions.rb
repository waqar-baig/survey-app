class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :question_type
      t.boolean :is_required
      t.references :merchant, foreign_key: true

      t.timestamps
    end
  end
end
