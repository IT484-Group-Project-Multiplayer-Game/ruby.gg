class User < ActiveRecord::Base
    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.name = auth.info.name
          user.oauth_token = auth.credentials.token
          user.oauth_expires_at = Time.at(auth.credentials.expires_at)
          user.save!
        end
    end
    
    attr_accessor :password
    #attr_accessible :email, :password, :password_confirmation
    has_secure_password(validations: false)
    before_save :encrypt_password
    
    validates_confirmation_of :password
    #validates_presence_of :password, :on => :create
    #validates_presence_of :email
    #validates_uniqueness_of :email 

    #validates :email, presence:true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }, uniqueness:true
    #validates :password, presence:true, length:{within:1..32}, confirmation:true
    
    def self.authenticate(email, password)
        user = find_by_email(email)
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
          user
        else
          nil
        end
    end
    
    def encrypt_password
        if password.present?
          self.password_salt = BCrypt::Engine.generate_salt
          self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
    end
    
end
