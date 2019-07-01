class Post < ApplicationRecord
    belongs_to :course
    has_many :responses
    belongs_to :student
end
