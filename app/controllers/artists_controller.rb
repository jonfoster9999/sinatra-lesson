class ArtistsController < ApplicationController 

    get '/artists' do
        erb :'artists/index'
    end

    get '/artists/new' do 
        @artist = Artist.new
        erb :'/artists/new'
    end

    get '/artists/:id/edit' do 
        @artist = Artist.find(params[:id])
        erb :'/artists/edit'
    end

    get '/artists/:id' do
        @artist = Artist.find(params[:id])
        erb :'/artists/show'
    end

    post '/artists' do 
        @artist = Artist.create(params[:artist])
        if !params[:song][:title].blank?
            @song = Song.create(params[:song])
            @song.artist = @artist 
            @song.save
        end
        @artist.save
        redirect "/artists/#{@artist.id}"
    end

    put '/artists/:id' do
        @artist = Artist.find(params[:id])
        @artist.update(params[:artist])
        redirect "/artists/#{@artist.id}"
    end

end