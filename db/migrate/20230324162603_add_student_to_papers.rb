class AddStudentToPapers < ActiveRecord::Migration[6.1]
  def change
    add_reference :papers, :student
  end
end
