# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(student)
    # signed students can read all the papers
    can :read, Paper, :all
    return unless student

    can :read_status, Paper
    can :manage, Paper, student_id: student.id
  end
end
