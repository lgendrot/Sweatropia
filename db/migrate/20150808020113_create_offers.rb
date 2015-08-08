class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :profile
      t.references :sweat
      t.integer :amount

      t.timestamps null: false
    end
  end
end
