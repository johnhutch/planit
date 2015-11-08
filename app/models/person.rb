class Person < ActiveRecord::Base
  has_and_belongs_to_many :plans
  has_many :made_plans, :class_name => "Plan", :foreign_key => "planner_id", :dependent => :destroy
  has_many :tokens, :dependent => :destroy
  has_many :responses, :dependent => :destroy

  validates_format_of :email, :with => /@/

  def planner_tokens
    self.tokens.where(is_planner_token: true)
  end

  def regular_tokens
    self.tokens.where(is_planner_token: false)
  end
end
