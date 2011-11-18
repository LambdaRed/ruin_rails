class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :title
      t.integer :dex
      t.integer :division_id

      t.timestamps
    end
  end
end
