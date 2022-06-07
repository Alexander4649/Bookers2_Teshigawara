class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      
      #t.integer :id#id integer 投稿画像を識別するID =>本のイメージ
      t.integer :user_id#user_id 投稿したユーザを識別するID =>投稿した人
      t.string :title#Title text => 投稿した本の名前
      t.text :body#Opinion text =>投稿した本の紹介
      
      t.timestamps
    end
  end
end
