FactoryGirl.define do
    factory :review do
        rating 4
        post   "Excellent bathroom"                
        bath_id 1
        user_id 1
        flag_count 1
    end
end