class CreateParticulars < ActiveRecord::Migration
  def change
    create_table :particulars do |t|
      t.string :type
      t.string :title
      t.integer :plan_id

      t.timestamps null: false
    end
  end
end
