class AddIsFinalizedToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :is_finalized, :boolean, :default => false
  end
end
