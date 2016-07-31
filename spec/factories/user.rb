FactoryGirl.define do
    factory :user do
        name "James Harden"
        email   "jharden@sfu.ca"                
        password    "dallan"
        password_confirmation   "dallan"
        role    "admin"
        ip_address  "142.58.35.86"
    end
    
    factory :female, class: User do
        name "Hilary Clinton"
        email   "cLInt@sfu.ca"                
        password    "dallan"
        password_confirmation   "dallan"
        role    "female"
        ip_address  "142.58.35.86"
    end
    
     factory :male, class: User do
        name "Drizzy Drake"
        email   "ovo@sfu.ca"                
        password    "dallan"
        password_confirmation   "dallan"
        role    "male"
        ip_address  "142.58.35.86"
    end
end