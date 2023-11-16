class Rating < ApplicationRecord
  belongs_to :paper

  after_save :update_average_rating_for_paper
  after_destroy :update_average_rating_for_paper

  def update_average_rating_for_paper
    avg_rating = paper.ratings.average('rating').to_f
    paper.update_attribute( :average_rating, avg_rating)
  end
end
