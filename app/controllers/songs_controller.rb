class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all.includes(:album).includes(:artist).paginate(page: params[:page], per_page: 10)
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    album = Album.find_by('title = ?', song_params['album_title'])
    params = song_params
    params.delete(:album_title)
    if album
      params['album_id'] = album.id
    end
    @song = Song.new(params)

    respond_to do |format|
      if @song.save
        format.html {redirect_to @song, notice: 'Song was successfully created.'}
        format.json {render :show, status: :created, location: @song}
      else
        format.html {render :new}
        format.json {render json: @song.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html {redirect_to @song, notice: 'Song was successfully updated.'}
        format.json {render :show, status: :ok, location: @song}
      else
        format.html {render :edit}
        format.json {render json: @song.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html {redirect_to songs_url, notice: 'Song was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  # SEARCH /search
  def search
    if params[:search] && params[:search] != ''
      @songs = Song.search(params[:search]).paginate(page: params[:page], per_page: 10)
      render partial: 'results', :content_type => 'text/html'
    elsif params[:search] == ''
      @songs = Song.all.paginate(page: params[:page], per_page: 10)
      render partial: 'results', :content_type => 'text/html'
    else
      @songs = Song.all.paginate(page: params[:page], per_page: 10)
      render :search
    end
  end

  private
  def set_song
    @song = Song.includes(:album).find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :album_title, :track_number, :length)
  end
end
