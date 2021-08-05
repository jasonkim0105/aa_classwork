class User < ApplicationRecord

  has_many :students,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

  belongs_to :enrollments,
    primary_key: :id,
    foreign_key: :id,
    class_name: :Enrollment

  belongs_to :enrolled_courses,
    primary_key: :id,
    foreign_key: :id,
    class_name: :Course
end
