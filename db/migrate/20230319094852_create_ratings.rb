class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.references :paper, null: false, foreign_key: true
      t.integer :rating
      t.references :student

      t.timestamps
    end
  end
end
