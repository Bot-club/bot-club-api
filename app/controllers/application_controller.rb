class ApplicationController < ActionController::API
    before_action :authenticate_auth_key!

    protected

    def authenticate_auth_key!
        user = DeviceConfig.find_by(auth_key: params['auth_key']).try(:user)
        if params['user_id'].present? && user.try(:id) == (params['user_id']).to_i
            @user = user
        else
            render json: { errors: "Token Not authenticated" },status: :unauthorized and return 
        end
    end
end
