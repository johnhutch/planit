class CreateTokens < ActiveRecord::Migration
  def up
    create_table(:tokens, :id => false) do |t|
      t.string :id, :null => false, :unique => true, :length => 64
      t.references :person, :null => false
      t.references :plan, :null => false
      t.boolean :is_planner_token, :default => false
      t.timestamps :null => false
    end
    execute "ALTER TABLE tokens ADD PRIMARY KEY (id);"
  end

  def down
    drop_table :tokens
  end
end
