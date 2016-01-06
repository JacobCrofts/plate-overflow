class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content, null: false
      t.integer :author_id, null: false
      t.boolean :is_best_answer, default: false
      t.integer :question_id, null: false

      t.timestamps
    end
  end
end
