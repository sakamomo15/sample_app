class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      # t.データ型 :カラム名 => rails db:migrateで反映
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
