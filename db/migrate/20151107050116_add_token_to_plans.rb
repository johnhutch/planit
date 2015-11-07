class AddTokenToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :token, :string
  end
end
