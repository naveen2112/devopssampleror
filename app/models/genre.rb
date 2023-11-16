class Genre < ApplicationRecord

  has_many :genres_papers
  has_many :papers, through: :genres_papers

  validates_uniqueness_of :name
end
