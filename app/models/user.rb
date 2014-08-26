class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauth_providers => [:google_oauth2, :linkedin]

  has_many :events, dependent: :destroy
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  

  def self.find_or_create_from_provider(provider, user_info, uid)
    user = User.find_by_email(user_info["email"])

    unless user
    if provider === "google_oauth2"
      image_url_formatted = user_info["image"].sub! 'sz=50', 'sz=150'
    elsif provider === "linkedin"
      image_url_formatted = user_info["image"]
    end
    user = User.create( first_name:   user_info["first_name"],
                          last_name:  user_info["last_name"],
                          image_url:  image_url_formatted,
                          email:      user_info["email"],
                          uid:        user_info["uid"],
                          provider:   user_info["provider"],
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

   def self.get_gravatars
    all.each do |user|
      if !user.avatar?
        user.avatar = URI.parse(user.gravatar_url)
        user.save
        print "."
      end
    end
  end
  
  def gravatar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)

    "http://gravatar.com/avatar/#{hash}"
  end

   def name_display
    if first_name || last_name
      "#{first_name} #{last_name}".strip
    else
      email
    end
  end
end

