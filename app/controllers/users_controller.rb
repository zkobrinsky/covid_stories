class UsersController < ApplicationController

    get '/signup' do
        erb :"/users/signup"
    end

    post '/users' do
        # binding.pry
        if !!User.find_by(username: params[:username])
            # raise "User name already exists"
            redirect to "/signup"
        elsif params[:password] == params[:password_confirmation]
            params.delete(:password_confirmation)
            user = User.create(params)
            session[:user_id] = user.id
            redirect to "/stories"
        else 
            # raise "Password Confirmation does not match Password"
            redirect to "/signup"
        end
    end
    
end