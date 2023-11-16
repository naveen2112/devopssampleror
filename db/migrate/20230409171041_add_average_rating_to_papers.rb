class AddAverageRatingToPapers < ActiveRecord::Migration[6.1]
  def change
    add_column :papers, :average_rating, :decimal, precision: 3, scale: 2
  end

  # updating average_rating for existing records
  Paper.find_each do |paper|
    avg_rating = paper.ratings.average('rating').to_f
    paper.update_attribute( :average_rating, avg_rating)
  end
end
