class User < ApplicationRecord

  has_many :students,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

  # belongs_to :enrollments,
  #   primary_key: :id,
  #   foreign_key: :student_id,
  #   class_name: :Enrollment

  belongs_to :enrolled_courses,
    through: :students,
    source: :course
end


