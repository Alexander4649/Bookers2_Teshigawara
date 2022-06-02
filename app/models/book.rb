class Book < ApplicationRecord
  
  has_one_attached :image #ActiveStoreage を使ってを使用してimageを認識させる
  
  belongs_to :user#アソシエーション=>N:1
  
  
end
