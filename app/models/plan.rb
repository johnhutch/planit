class Plan < ActiveRecord::Base
  has_and_belongs_to_many :people
  belongs_to :planner, :class_name => "Person"
  has_many :particulars
  has_many :tokens, :dependent => :destroy
  has_one :planner_token, :class_name => "Token", :foreign_key => "id", :dependent => :destroy

  accepts_nested_attributes_for :particulars, :allow_destroy => true

  delegate :pwhiches, :pwheres, :pwhens, to: :particulars

  # Now routes like edit_plan_path(@plan) will use the planner_token_id
  def to_param
    planner_token_id
  end
end
