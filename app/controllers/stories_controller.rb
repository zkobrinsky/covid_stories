class StoriesController < ApplicationController

    get '/stories' do
        erb :"stories/index"
    end

    get '/stories/new' do
        erb :"stories/new"
    end

    post '/stories/new' do
        story = Story.create(params)
        if logged_in?
            story.update(user_id: session[:user_id])
        end
        redirect to "stories/#{story.id}"
    end

    get '/stories/:id' do
        @story = Story.find_by_id(params[:id])
        erb: "stories/show"
        binding.pry
    end
    
    
end