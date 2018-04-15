class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :type, :string
    add_column :users, :employer, :boolean
  end
end
