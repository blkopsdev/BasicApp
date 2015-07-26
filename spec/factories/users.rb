FactoryGirl.define do
  factory :user do
  	factory :user1 do
	    name "Test User"
	    email "test@example.com"
	    password "please123"
	  end
	  factory :user2 do
  		name "Admin User"
  		email "admin@example.com"
  		password "admin123"
  		admin true
	  end
  end
end
