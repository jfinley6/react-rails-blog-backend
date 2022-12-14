class SessionsController < ApplicationController
    before_action :set_current_user

    def set_current_user
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        end
    end

    def create
        user = User.find_by(email: params["user"]["email"])
                   &.authenticate(params["user"]["password"])

        if user
            session[:user_id] = user.id
            render json: {
                status: :created,
                logged_in: true,
                user: user
            }
        else
            render json: { status: 401 }
        end
    end

    def logged_in
        if @current_user
            render json: {
                logged_in: true,
                user: @current_user
            }
        else
            render json: {
                logged_in: false
            }
        end
    end

    def logout
        reset_session
        render json: { status: 200, logged_out: true }
    end

end