class TimeCard < ApplicationRecord
  belongs_to :user, optional: true
    
end
