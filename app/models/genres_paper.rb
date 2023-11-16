class GenresPaper < ApplicationRecord

  belongs_to :paper
  belongs_to :genre

  validates_uniqueness_of :paper_id, scope: :genre_id
end
