class User < ApplicationRecord
    has_many :children

    validates :email,
    presence: true,
    uniqueness: {case_sensitive: false}

    validates :password, 
    length: {in: 7..35}, 
    on: :create
    

    #rails magic, making sure that bcrypt is used for password
    has_secure_password

    def self.authenticate(params)
        User.find_by_email(params[:email]).try(:authenticate, params[:password])
    end    
end
