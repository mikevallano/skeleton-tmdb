class TmdbController < ApplicationController

  require 'open-uri'
  include TmdbHandler

  def search
    if params[:movie_title]
      @movie_title = params[:movie_title].gsub(" ","-")
      tmdb_call_search(@movie_title)
    else
      @movie_title = nil
    end

  end

  def more
    if params[:movie_id]
      @movie_id = params[:movie_id]
      tmdb_call_movie(@movie_id)
    else
      @movie_id = nil
    end
  end

end
