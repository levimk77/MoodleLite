class Student < ApplicationRecord
    has_secure_password
    
    has_many :enrollments
    has_many :posts
    has_many :responses
    has_many :courses, through: :enrollments

    validates :name, :age, :email, :year, :major, presence: true
    validates :email, uniqueness: true
    
    def self.find_student(student, year, major)
        students = []
        stdtname = student.downcase.split(" ")
        # byebug
        Student.all.each do |student|
            stdtname2 = student.name.downcase.split(" ")
            # byebug
            if stdtname & stdtname2 != [] && student.major == major && student.year == year
                # byebug
                students << student
            end
            # byebug
        end
        students
    end

end
