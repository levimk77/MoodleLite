class Student < ApplicationRecord
    has_many :enrollments
    has_many :posts
    has_many :responses
    has_many :courses, through: :enrollments
end
