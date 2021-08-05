class Course < ApplicationRecord

  has_many :enrollment,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

  has_many :user,
    primary_key: :id,
    foreign_key: :id,
    class_name: :User

  # belongs_to :enrollments,
  #   primary_key: :id,
  #   foreign_key: :course_id,
  #   class_name: :Enrollment

end
