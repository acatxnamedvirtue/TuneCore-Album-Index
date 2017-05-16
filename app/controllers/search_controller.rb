class SearchController < ApplicationController
  # SEARCH /search
  def search
    if params[:search] && params[:search] != ''
      @songs = execute_search(params[:search]).paginate(page: params[:page], per_page: 10)
      render :search, :content_type => 'text/html'
    elsif params[:search] == ''
      @songs = Song.all.paginate(page: params[:page], per_page: 10)
      render :search, :content_type => 'text/html'
    else
      @songs = Song.all.paginate(page: params[:page], per_page: 10)
      render :search
    end
  end

  def execute_search(search)
    if ActiveRecord::Base.connection.instance_values['config'][:adapter] == 'mysql2'
      Song.where('MATCH(title, album_title, artist_name) AGAINST ("?" IN BOOLEAN MODE)', search)
    elsif ActiveRecord::Base.connection.instance_values['config'][:adapter] == 'postgresql'
      Song.where("to_tsvector('english', title || ' ' || artist_name || ' ' || album_title) @@ to_tsquery('english', ?)",
                 search.split(' ').join(' & '))
    end
  end
end

