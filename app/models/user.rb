class User < ApplicationRecord
    validates :name, length: { minimum: 2, maximum: 20 },presence: true,uniqueness: true
    validates :introduction, length: { maximum: 50 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #:database_authenticatable（パスワードの正確性を検証）
         #:registerable（ユーザ登録や編集、削除）
         #:recoverable（パスワードをリセット）
         #:rememberable（ログイン情報を保存）
         #:validatable（email のフォーマットなどのバリデーション）
         has_many :books, dependent: :destroy#アソシエーション=>1:N
         
         
         
         has_one_attached :profile_image#プロフィール画像を保存できる設定
         
        # プロフィール画像の自動サイズ設定
         def get_profile_image(width, height)
         unless profile_image.attached?
         file_path = Rails.root.join('app/assets/images/default-image.jpeg')
         profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
         end
           profile_image.variant(resize_to_limit: [width, height]).processed
         end
         
end
