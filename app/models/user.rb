class User < ActiveRecord::Base
    has_many :stories
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
end