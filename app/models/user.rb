class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: NAME_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name, presence: true, format: { with: NAME_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :family_name_rubi, presence: true, format: { with: NAME_KANA_REGEX, message: 'は全角カタカナで入力してください' }
  validates :first_name_rubi, presence: true, format: { with: NAME_KANA_REGEX, message: 'は全角カタカナで入力してください' }
  validates :date_of_birth, presence: true
  validates :password, format: { with: PASSWORD_REGEX, message: 'は半角英字と数字の両方を含めて設定してください' }
end
