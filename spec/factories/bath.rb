FactoryGirl.define do
    factory :bath do
        country "CAN"
        province   "BC"                
        city    "North Vancouver"
        address   "1400 Riverside Drive"
        admin_accept true
        user_id 1
    end
end