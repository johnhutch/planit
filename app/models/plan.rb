class Plan < ActiveRecord::Base
  has_and_belongs_to_many :people
  belongs_to :planner, :class_name => "Person"
  has_many :particulars
  has_many :tokens, :dependent => :destroy

  accepts_nested_attributes_for :particulars, :allow_destroy => true

  delegate :pwhiches, :pwheres, :pwhens, to: :particulars

  def planner_token
    self.tokens.where(is_planner_token: true).first
  end

  def normal_tokens
    self.tokens.where(is_planner_token: false)
  end
end
