class CreatePapers < ActiveRecord::Migration[5.0]
  def change
    create_table :papers do |t|
      t.string :name
      t.references :category
      t.datetime :release_date
      t.string :language

      t.timestamps
    end
  end
end
