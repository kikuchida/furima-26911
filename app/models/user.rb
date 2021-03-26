class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birthday, presence: true # 空では登録できない

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角で入力してください。' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい。' } do
    validates :last_name_reading
    validates :first_name_reading
  end

  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: 'パスワードは半角英数字混合で入力して下さい' }
end
