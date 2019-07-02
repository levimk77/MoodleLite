class Response < ApplicationRecord
    belongs_to :student
    belongs_to :post
    validates :content, presence: true
end
