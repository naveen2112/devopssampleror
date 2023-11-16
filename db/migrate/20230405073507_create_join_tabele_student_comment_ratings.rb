class CreateJoinTabeleStudentCommentRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :student_comment_ratings do |t|
      t.references :student
      t.references :comment
      t.integer :rating
      t.timestamps
    end
  end
end
