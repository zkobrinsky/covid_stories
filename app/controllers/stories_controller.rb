class StoriesController < ApplicationController

    # get '/stories' do
    #     if current_user
    #         @stories = @user.stories.all
    #     end
    #     erb :"stories/index"
    # end

    get '/stories/new' do
        erb :"stories/new"
    end

    post '/stories' do
        story = Story.create(params)
        # if logged_in?
        #     story.update(user_id: session[:user_id])
        # end
        redirect to "stories/#{story.id}"
    end

    get '/stories/:id' do
        current_story
        erb :"stories/show"
    end

    # get '/stories/:id/edit' do
    #     current_story
    #     if logged_in? && current_user.id == @story.user_id
            
    #     erb :"stories/edit"
    #     elsif logged_in?
    #         redirect to "/stories"
    #     else
    #         erb :"stories/edit"
    #     end
    # end

    # patch '/stories/:id' do
    #     current_story
    #     if logged_in? && current_user.id == @story.user_id
    #         @story.update(title: params[:title], content: params[:content])
    #     end
    #     redirect to "/stories/#{@story.id}"
    # end

    # delete '/stories/:id' do
    #     current_story
    #     if logged_in? && current_user.id == @story.user_id
    #         @story.delete
    #     end
    #     redirect to "/stories"
    # end
    
    
end