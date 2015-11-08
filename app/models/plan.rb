class Plan < ActiveRecord::Base
  has_and_belongs_to_many :people
  belongs_to :planner, :class_name => "Person"
  has_many :particulars
  has_many :tokens, :dependent => :destroy
  has_one :planner_token, :class_name => "Token", :foreign_key => "id", :dependent => :destroy
  has_many :responses, :dependent => :destroy

  accepts_nested_attributes_for :particulars, :allow_destroy => true

  delegate :pwhiches, :pwheres, :pwhens, to: :particulars

  # Now routes like edit_plan_path(@plan) will use the planner_token_id
  def to_param
    planner_token_id
  end

  def regular_tokens
    self.tokens.where(is_planner_token: false)
  end

  def planners_other_token
    self.tokens.where(is_planner_token: false, person_id: self.planner_id).first
  end

  def send_out_invites
    self.regular_tokens.each do |t|
      PlanMailer.invite(t).deliver_now
    end
  end
end
