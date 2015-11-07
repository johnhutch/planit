class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :planner_id

      t.timestamps null: false
    end
  end
end
