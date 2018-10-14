class User < ApplicationRecord
    validates_presence_of :name, :email
    validates :email, uniqueness: true
    has_many  :device_configs


    private 

    def gen_auth_key
        auth_key = SecureRandom.base64(32)
        DeviceConfig.create(user: self, auth_key: auth_key)
        auth_key
    end
end
