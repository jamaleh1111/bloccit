class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

<<<<<<< HEAD
  has_many :posts
=======
  def admin?
    role == 'admin'
  end 

  def moderator?
    role == 'moderator'
  end 
  
>>>>>>> cp-39-authorization
end
