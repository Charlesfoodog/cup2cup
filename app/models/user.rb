class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauth_providers => [:google_oauth2]

  has_many :events, through: :meetings
  has_many :meetings

  def self.find_or_create_from_google(user_info, uid)
    user = User.find_by_email(user_info["email"])

    unless user
    user = User.create( first_name: user_info["first_name"],
                          last_name:  user_info["last_name"],
                          email:      user_info["email"],
                          uid:        user_info["uid"],
                          provider:   user_info["google_oauth2"],
                          password:   Devise.friendly_token)
    end
    user
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      Rails.logger.info "auth.info #{auth.info}"
      user.email = auth.info.email
     end
   end
end

