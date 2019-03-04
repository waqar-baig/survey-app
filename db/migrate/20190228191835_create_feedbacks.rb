class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table   :feedbacks do |t|
      t.references :customer, foreign_key: true
      t.references :merchant, foreign_key: true
      t.references :feedback_form, foreign_key: true
      t.integer    :status
      t.datetime   :completed_at

      t.timestamps
    end
  end
end
