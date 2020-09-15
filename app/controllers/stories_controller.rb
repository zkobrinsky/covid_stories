class StoriesController < ApplicationController

    get '/stories' do
        if current_user
            @stories = @user.stories.all
        end
        erb :"stories/index"
    end

    get '/stories/new' do
        erb :"stories/new"
    end

    post '/stories' do
        story = Story.create(params)
        if logged_in?
            story.update(user_id: session[:user_id])
        end
        redirect to "stories/#{story.id}"
    end

    get '/stories/:id' do
        @story = Story.find_by_id(params[:id])
        erb :"stories/show"
    end

    get '/stories/:id/edit' do
        #edit story page
        erb :"stories/edit"
    end

    patch '/stories/:id' do
        #receives edited story
    end

    delete 'stories/:id' do
        #deletes a post from db by id
    end
    
    
end