class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles #nombre del modelo al que hereda la llave foranea(plural)
  has_one_attached :avatar
  #admin => true / false
end
