class CreateSweats < ActiveRecord::Migration
  def change
    create_table :sweats do |t|
      t.integer :amount
      t.decimal :price
      t.boolean :bulk_discount
      t.integer :bulk_minimum
      t.decimal :bulk_price

      t.references :user

      t.timestamps null: false
    end
  end
end
