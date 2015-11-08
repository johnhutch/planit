class AddPlannerTokenIdToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :planner_token_id, :string, :length => 64
  end
end
