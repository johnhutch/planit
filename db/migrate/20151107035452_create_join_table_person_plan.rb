class CreateJoinTablePersonPlan < ActiveRecord::Migration
  def change
    create_join_table :people, :plans do |t|
      # t.index [:person_id, :plan_id]
      # t.index [:plan_id, :person_id]
    end
  end
end
