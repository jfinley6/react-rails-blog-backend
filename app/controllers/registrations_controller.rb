class RegistrationsController < ApplicationController

    def create
        user = User.create!(
            username: params['user']['username'],
            email: params['user']['email'],
            password: params['user']['password'],
            password_confirmation: params['user']['password_confirmation']
        )

        if user
            session[:user_id] = user.id
            render json: {
                status: :created,
                user: user
            }
        else
            render json: { status: 500 }
        end
    end

    def update
        user = User.find_by_id(params[:id])
        user.update!(
            username: params['user']['username']

        )
    end

    def picture
        user = User.find_by_id(params[:id])
        user.update!(
            picture: params['user']['picture']
        )
    end

end