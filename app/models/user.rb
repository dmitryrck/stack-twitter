class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable and recoverable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
end
