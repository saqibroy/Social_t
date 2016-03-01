class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :public_name
      t.string :public_key
      t.string :private_name
      t.string :private_key

      t.timestamps null: false
    end
  end
end
