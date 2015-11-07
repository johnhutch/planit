FactoryGirl.define do
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
    planner_id planner.id
    people {[create(:friend1), create(:friend2), create(:friend3)] }
  end
end
