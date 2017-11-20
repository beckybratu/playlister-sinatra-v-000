class SongsController < ApplicationController

  get '/songs' do
   @songs = Song.all
   erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(:name => params[:name], :artist => params[:artist], :genre => params[:genre])
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  # patch '/songs/:slug' do
  #   @song = Song.find_by_slug(params[:slug])
  #   @song.name = params[:name]
  #   @song.artist.name = params[:artist.name]
  #   @song.genre.name = params[:genre.name]
  #   @song.save
  #   erb :'songs/show'
  # end

end
