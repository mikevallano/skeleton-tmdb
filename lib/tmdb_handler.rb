module TmdbHandler

  def tmdb_call_search(query)
    @search_url = "http://api.themoviedb.org/3/search/movie?query=#{query}&api_key=#{ENV['tmdb_api_key']}"
    @content = open(@search_url).read
    @tmdb_response = JSON.parse(@content, symbolize_names: true)
    @results = @tmdb_response[:results]
  end

  def tmdb_call_movie(id)
    @movie_url = "https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV['tmdb_api_key']}&append_to_response=trailers"
    @content = open(@movie_url).read
    @result = JSON.parse(@content, symbolize_names: true)
  end

  def tmdb_create_movie(id)
    tmdb_call_movie(id)
    Movie.create(title: @result[:title], tmdb_id: @result[:id], imdb_id: @result[:imdb_id])
  end

end