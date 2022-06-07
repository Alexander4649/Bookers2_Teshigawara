class Book < ApplicationRecord
  
  validates :title, presence: true#バリデーション
	validates :body, presence: true,length: { maximum: 200 }#バリデーション最大文字数200文字
	
  has_one_attached :image #ActiveStoreage を使ってを使用してimageを認識させる
  
  belongs_to :user#アソシエーション=>N:1
  
end
