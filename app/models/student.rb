class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :papers
  has_and_belongs_to_many :paper_read_status,
                          join_table: 'paper_read_status',
                          class_name: 'Paper',
                          inverse_of: :paper_read_status
  has_many :student_comment_ratings
  has_many :comments, through: :student_comment_ratings
end
