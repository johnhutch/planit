FactoryGirl.define do  factory :answer do
    other "MyText"
choice_id 1
response_id 1
  end
  factory :response do
    person_id 1
plan_id 1
  end
  
  factory :choice do
    particular_id 1
    answer "MyString"
  end

  factory :token do
  end

  factory :planner, class: Person do
    email "planner@whatever.com"
  end

  factory :friend1, class: Person do
    email "friend1@whatever.com"
  end

  factory :friend2, class: Person do
    email "friend2@whatever.com"
  end

  factory :friend3, class: Person do
    email "friend3@whatever.com"
  end

  factory :friend4, class: Person do
    email "friend4@whatever.com"
  end

  factory :plan do
    association :planner, factory: :planner
    people {[create(:friend1), create(:friend2), create(:friend3)] }
  end
end
