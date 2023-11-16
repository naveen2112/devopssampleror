class AddPapersCountToCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :papers_count, :integer, default: 0, null: false
  end
end
