class Post < ApplicationRecord
    belongs_to :course
    has_many :responses, dependent: :destroy
    belongs_to :student
    
    validates :title, presence: true

end
