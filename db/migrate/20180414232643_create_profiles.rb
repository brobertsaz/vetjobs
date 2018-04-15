class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :company_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.timestamps
    end
  end
end
