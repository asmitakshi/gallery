class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
 
  has_many :albums
#devise :database_authenticatable, :registerable, :confirmable, :recoverable, stretches: 13
        
end
