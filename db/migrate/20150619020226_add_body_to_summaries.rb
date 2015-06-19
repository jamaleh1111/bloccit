class AddBodyToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :body, :text
  end
end
