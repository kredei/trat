class AddChats < ActiveRecord::Migration
  def up
    create_table :chats do |t|
      t.string :guid, :null => false
      t.timestamps
    end
    change_table :lines do |t|
      t.references :chat
    end
  end

  def down
    drop_table :chats
    remove_column :lines, :chat_id
  end
end
