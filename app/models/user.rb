class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  validates :fullname, presence:true, length: {maximum: 50}
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  has_many :rooms
  has_many :reservations
  has_many :reviews
  
  def self.from_omniau(auth)
    user = User.where(email: auth.info.email).first
    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
        u.fullname = auth.info.name
        u.provider = auth.provider
        u.uid = auth.uid
        u.email = auth.info.email
        u.image = auth.info.image
        u.password = Devise.friendly_token[0,20]
      end
    end
  end
  
end
