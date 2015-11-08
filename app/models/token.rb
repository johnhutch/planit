class Token < ActiveRecord::Base
  belongs_to :person
  belongs_to :plan
  self.primary_key = 'id'

  def become_regular_token(plan, person)
    self.id = SecureRandom.hex(32)
    self.is_planner_token = false
    self.plan = plan
    self.person = person
  end

  def become_planner_token(plan, planner)
    self.id = SecureRandom.hex(32)
    self.is_planner_token = true
    self.plan = plan
    self.person = planner
  end
end
