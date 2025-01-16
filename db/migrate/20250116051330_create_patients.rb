class CreatePatients < ActiveRecord::Migration[8.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.datetime :next_appointment

      t.timestamps
    end
    add_index :patients, :email
  end
end
