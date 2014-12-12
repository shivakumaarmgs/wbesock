class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :os_type
      t.string :message
      t.string :batch

      t.timestamps
    end
  end
end
