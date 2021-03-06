class User < ApplicationRecord
    validates :username, :password_digest, :session_token, presence: true
    validates :username uniqueness: true
    validates :password, length: {minimum: 6}, allow_nil: true
    after_initalize :ensure_session_token

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username);
        if user && user.is_password?(password) 
            return user;
        else 
            return nil;
        end
    end

    def password
        @password
    end

    def password=(password)
        @password = password
        self.password_diguest = BCrpyt::Password.create(password);
    end

    def is_password?(password)
        password_object = BCrpyt::Password.new(self.password_digest)
        password_object.is_password?(password)
       
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save
        self.session_token 
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
    
    
end
