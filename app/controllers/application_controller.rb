require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "dragon_ball_758321U"
  end

  get "/" do
    @stories = Story.all
    @sorted_stories = @stories.order(id: :desc)
    @random_stories = @stories[0..-2].sample(10)
    erb :welcome
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user = User.find_by_id(session[:user_id]) if logged_in?
    end

    def logout
      session.clear
    end

    def current_story
      @story = Story.find_by_id(params[:id])
    end
  end

end
