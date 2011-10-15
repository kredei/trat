class AddTranslations < ActiveRecord::Migration
  def up
    create_table :translations do |t|
      t.string :text
      t.string :language
      t.references :lines
      t.timestamps
    end
  end

  def down
    drop_table :translations
  end
end
