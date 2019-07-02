class Course < ApplicationRecord
    has_many :enrollments, dependent: :destroy
    has_many :students, through: :enrollments
    has_many :posts, dependent: :destroy
    has_many :responses, through: :posts

    validates :code, :name, :teacher, :department, presence: true
    validates :code, uniqueness:true
end
