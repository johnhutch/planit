class Plan < ActiveRecord::Base
  has_and_belongs_to_many :people
  belongs_to :planner, :class_name => "Person"
  has_many :particulars

  accepts_nested_attributes_for :particulars, :allow_destroy => true
end
