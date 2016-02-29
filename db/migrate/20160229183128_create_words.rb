class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.integer :type
      t.text :word_content

      t.timestamps null: false
    end
  end
end
