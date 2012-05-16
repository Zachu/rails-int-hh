class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :password, :password_confirmation, :locale, :firstname, :lastname, :image, :phone, :address, :description
    
  validates :email, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true

  validates :locale,   inclusion: { in: %w(fi en) }

  def name
    self.firstname+" "+self.lastname
  end

end
