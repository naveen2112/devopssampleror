class CreateJoinTableStudentPaperReadStatus < ActiveRecord::Migration[6.1]
  def change
    create_join_table :students, :papers, table_name: :paper_read_status do |t|
      t.index [:student_id, :paper_id]
    end
  end
end
