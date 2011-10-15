class AddLines < ActiveRecord::Migration
  def up
    create_table :lines do |t|
      t.string :text
      t.timestamps
    end
  end

  def down
    drop_table :lines
  end
end
