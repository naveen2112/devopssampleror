class StudentCommentRating < ApplicationRecord
  belongs_to :comment
  belongs_to :student
end