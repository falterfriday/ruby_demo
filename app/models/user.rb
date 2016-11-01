class User < ApplicationRecord
  has_many :secrets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret
#-------------------------BCRYPT-------------------------
  has_secure_password

#------------------------EMAIL_REGEX------------------------
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

#------------------------VALIDATIONS------------------------
  validates :name,
              presence:true
  validates :email,
              presence:true,
              uniqueness:{
                case_sensitive:false
              },
              format: {
                with:EMAIL_REGEX
              }
end
