class Course < ApplicationRecord
    has_many :enrollments
    has_many :students, through: :enrollments
    has_many :posts
    has_many :responses, through: :posts
end
