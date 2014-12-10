class CreateGroupMessages < ActiveRecord::Migration
  def change
    create_table :group_messages do |t|
      t.string :body
      t.string :username

      t.timestamps
    end
  end
end
