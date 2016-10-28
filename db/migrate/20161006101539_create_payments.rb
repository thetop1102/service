class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.text :content
      t.integer :amount
      t.integer :classify, default: 0
      t.references :booking, foreign_key: true
      t.datetime :purchased_at
      t.string :transaction_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
