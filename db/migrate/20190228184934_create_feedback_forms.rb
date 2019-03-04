class CreateFeedbackForms < ActiveRecord::Migration[5.1]
  def change
    create_table :feedback_forms do |t|
      t.string :title
      t.integer :status
      t.references :merchant, foreign_key: true

      t.timestamps
    end
  end
end
