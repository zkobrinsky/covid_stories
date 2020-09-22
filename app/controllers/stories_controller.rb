class StoriesController < ApplicationController

    get '/stories/new' do
        erb :"stories/new"
    end

    post '/stories' do
        story = Story.create(params)
        redirect to "stories/#{story.id}"
    end

    get '/stories/:id' do
        current_story
        erb :"stories/show"
    end

end