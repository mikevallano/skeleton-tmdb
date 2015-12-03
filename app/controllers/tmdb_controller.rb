class TmdbController < ApplicationController

  require 'open-uri'

  def search
    if params[:movie_title]
      @movie_title = params[:movie_title].gsub(" ","-")
      @search_url = "http://api.themoviedb.org/3/search/movie?query=#{@movie_title}&api_key=#{ENV['tmdb_api_key']}"
      @content = open(@search_url).read
      @tmdb_response = JSON.parse(@content, symbolize_names: true)
      @results = @tmdb_response[:results]

    else
      @movie_title = nil
    end

  end

  def more
    if params[:movie_id]
      @movie_id = params[:movie_id]
      @movie_url = "https://api.themoviedb.org/3/movie/#{@movie_id}?api_key=#{ENV['tmdb_api_key']}&append_to_response=trailers"
      @content = open(@movie_url).read
      @result = JSON.parse(@content, symbolize_names: true)
    else
      @movie_id = nil
    end
  end

end
