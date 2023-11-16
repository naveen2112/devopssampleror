class AddStudentsToComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :student
  end
end
