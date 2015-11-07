class Person < ActiveRecord::Base
  has_and_belongs_to_many :plans
  has_many :made_plans, :class_name => "Plan", :foreign_key => "planner_id", :dependent => :destroy

  accepts_nested_attributes_for :made_plans, :allow_destroy => true

  validates_format_of :email, :with => /@/
end
