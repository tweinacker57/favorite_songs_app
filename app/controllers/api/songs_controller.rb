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
    render "show.json.jb"
  end
end
