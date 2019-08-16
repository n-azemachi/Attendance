FactoryBot.define do
  factory :time_card do
    division { '出勤' }
    day { '2019-08-15' }
    starttime { '08:45' }
    endtime { '17:30' }
    user
  end
end
