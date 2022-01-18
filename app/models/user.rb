class User < ApplicationRecord
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/}
  validates :last_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :nickname, presence: true
  validates :date_of_birth, presence: true
  validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/ }, unique: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}, length: { minimum: 6 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
