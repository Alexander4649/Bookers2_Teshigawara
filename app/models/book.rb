class Book < ApplicationRecord
  validates :title, presence: true#バリデーション
	validates :body, presence: true#バリデーション
  has_one_attached :image #ActiveStoreage を使ってを使用してimageを認識させる
  
  belongs_to :user#アソシエーション=>N:1
  
end
