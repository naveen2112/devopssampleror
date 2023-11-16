class Comment < ApplicationRecord

  belongs_to :paper
  has_many :student_comment_ratings
  has_many :students, through: :student_comment_ratings
end
