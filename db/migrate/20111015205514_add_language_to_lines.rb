class AddLanguageToLines < ActiveRecord::Migration
  def change
    change_table :lines do |t|
      t.string :language
    end
  end
end
