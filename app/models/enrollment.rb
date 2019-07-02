class Enrollment < ApplicationRecord
    belongs_to :student
    belongs_to :course
    validates :course_id, :student_id, presence: true
end
