class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question_id, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
