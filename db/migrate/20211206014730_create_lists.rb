class CreateLists < ActiveRecord::Migration[5.2]
  def change
    #テーブルを作成
    create_table :lists do |t|
    
      #テーブルのデータ型、カラム名  
      t.string:title
      t.string:body

      t.timestamps
    end
  end
end
