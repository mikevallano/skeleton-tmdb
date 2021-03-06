class TmdbController < ApplicationController

  require 'open-uri'
  include TmdbHandler

  def search
    if params[:movie_title]
      @movie_title = params[:movie_title].gsub(' ', '-')
      tmdb_handler_search(@movie_title)
    end
  end

  def more
    if params[:movie_id]
      @movie_id = params[:movie_id]
      tmdb_handler_movie_info(@movie_id)
    else
      redirect_to api_search_path
    end
  end

end
