class Category < ApplicationRecord

  has_many :papers, dependent: :destroy

  validates_uniqueness_of :name
  validates :description  ,length: { maximum: 250 }
end
