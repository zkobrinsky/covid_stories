class SessionController < ApplicationController
    
    get '/login' do
        erb :"session/login"
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && !!user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/stories'
        else
            redirect '/login'
        end
    end

    post '/logout' do
        session.clear
        redirect '/'
    end


end