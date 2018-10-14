class Api::V1::UsersController < ApplicationController
    skip_before_action :authenticate_auth_key!, :only => [:register]

     # POST /register
    def register
        @user = User.new(user_params)
        if @user.save
            response = { message: 'User created successfully', auth_key: user.gen_auth_key}
            render json: response, status: :created 
        else
            render json: @user.errors, status: :bad
        end 
    end

    # POST /sign_in
    def sign_in
        @user = User.find_by(email: params['email'], password: params['password'])
        if @user
            response = { message: 'User created successfully', auth_key: user.gen_auth_key}
            render json: response, status: :created 
        else
            render json: {error: 'Invalid email or password'}, status: :bad
        end 
    end

    private

    def user_params
        params.permit(
        :name,
        :email,
        :password,
        :class,
        :school
        )
    end
end
