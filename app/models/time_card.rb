class TimeCard < ApplicationRecord
    belongs_to :user
    
    validates :day, uniqueness: true
end
