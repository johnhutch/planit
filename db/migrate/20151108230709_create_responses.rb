class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :person_id
      t.integer :plan_id

      t.timestamps null: false
    end
  end
end
