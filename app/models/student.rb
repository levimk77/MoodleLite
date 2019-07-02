class Student < ApplicationRecord
    has_secure_password
    
    has_many :enrollments
    has_many :posts
    has_many :responses
    has_many :courses, through: :enrollments

    validates :name, :age, :email, :year, :major, presence: true
    validates :email, uniqueness: true
    
end
