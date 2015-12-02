FactoryGirl.define do 
	factory :movie do
		title "Terminator"
		rating "PG-13"
		description "Action pack movie of the year"
		release_date DateTime.now 
		director "Joe Doe"
	end
end