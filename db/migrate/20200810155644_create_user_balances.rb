class CreateUserBalances < ActiveRecord::Migration[5.1]
  def change
    create_table :user_balances do |t|
      t.integer :user_id
      t.integer :balance
      t.integer :balance_achieve
      t.timestamps
    end
  end
end
