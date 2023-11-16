class CreateGenresPapers < ActiveRecord::Migration[5.0]
  def change
    create_table :genres_papers do |t|
      t.references :paper, foreign_key: true
      t.references :genre, foreign_key: true
    end
  end
end
