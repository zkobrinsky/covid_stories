class UsersController < ApplicationController

    get '/signup' do
        erb :"/users/signup"
    end

    post '/users' do
        user = User.create(params)
        if !user.valid?
            @errors = user.errors.full_messages
            erb :"users/error"
        elsif user.authenticate(params[:password])
            params.delete(:password_confirmation)
            session[:user_id] = user.id
            redirect to "/stories"
        end
    end
    
end