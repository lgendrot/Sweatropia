class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :bio
      t.references :user
      t.timestamps null: false
    end

    remove_reference :sweats, :user
    add_reference :sweats, :profile

  end

end
