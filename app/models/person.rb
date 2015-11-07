class Person < ActiveRecord::Base
  has_and_belongs_to_many :plans
  has_many :made_plans, :class_name => "Plan", :foreign_key => "planner_id"
end
