class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :location
      t.string :position_type
      t.decimal :low_salary, precision: 8, scale: 2
      t.decimal :high_salary, precision: 8, scale: 2
      t.text :description

      t.references :employer
      t.timestamps
    end
  end
end
