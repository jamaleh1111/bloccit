class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :answers, :Question_id, :question_id
  end
end
