class CreateBalanceBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :balance_banks do |t|
      t.integer :balance
      t.integer :balance_achieve
      t.string :code
      t.boolean :enable, default: true

      t.timestamps
    end
  end
end
