class CreateUserBalanceHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :user_balance_histories do |t|
      t.integer :user_balance_id
      t.integer :balance_before
      t.integer :balance_after
      t.string :activity
      t.string :ip
      t.string :location
      t.string :user_agent
      t.string :author
      t.timestamps
    end
    add_column :user_balance_histories, :type, "ENUM('credit','debit') DEFAULT 'credit'"


  end
end
