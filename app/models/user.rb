class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday

    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'カタカナで入力してください' }
    validates :last_name_kana,  format: { with: /\A[ァ-ヶー]+\z/, message: 'カタカナで入力してください' }

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
      validates :first_name
      validates :last_name
    end
  end
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  FULL_WIDTH_REGEX = /[^\x20-\x7E]/.freeze

  validates :password, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }
  validates :password, format: { without: FULL_WIDTH_REGEX, message: 'には半角英数字を使用してください' }


end
