class Course < ApplicationRecord
    has_many :enrollments, dependent: :destroy
    has_many :students, through: :enrollments
    has_many :posts, dependent: :destroy
    has_many :responses, through: :posts

    validates :code, :name, :teacher, :department, presence: true
    validates :code, uniqueness:true

    def self.find_course(course)
        courses = []
        a = course.downcase.split(" ")
        # byebug
        Course.all.each do |course|
            d2 = course.name.downcase.split(" ")
            # byebug
            if a & d2 != []
                # byebug
                courses << course
            elsif a[0] == course.code
                # byebug
                courses << course
            end
            # byebug
        end
        courses
    end

end
