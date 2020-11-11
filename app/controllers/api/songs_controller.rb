class Api::SongsController < ApplicationController
  def index
    @songs = Song.all
    render "index.json.jb"
  end

  def show
    id = params[:id]
    @song = Song.find_by(id: id)
    render "show.json.jb"
  end

  def create
    @song = Song.new(
      title: params[:title],
      album: params[:album],
      artist: params[:artist],
      year: params[:year]
    )
    @song.save
    render "show.json.jb"
  end

  def update
    @song = Song.find_by(id: params[:id])
    @song.title = params[:title]
    @song.album = params[:album]
    @song.artist = params[:artist]
    @song.year = params[:year]
    @song.save
    render "show.json.jb"
  end

  def destroy
    @song = Song.find_by(id: params[:id])
    @song.destroy
    render json: {message: "Song has been removed"}
  end
end
