class RemoveReferencesFromAnswers < ActiveRecord::Migration
  def change
    remove_reference :answers, :question_id, index: true, foreign_key: true
  end
end
