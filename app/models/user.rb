class User < ApplicationRecord
    validates_presence_of :name, :email
    validates :email, uniqueness: true
    has_many  :device_configs

end
