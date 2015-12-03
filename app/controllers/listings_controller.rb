class ListingsController < ApplicationController

  def create
    @listing = Listing.new(listing_params)

    @tmdb_id = params[:tmdb_id]

    if Movie.exists?(tmdb_id: @tmdb_id)
      @movie = Movie.find_by_tmdb_id(@tmdb_id)
      @listing.movie_id = @movie.id
    else
      @movie_url = "https://api.themoviedb.org/3/movie/#{@tmdb_id}?api_key=#{ENV['tmdb_api_key']}"
      @content = open(@movie_url).read
      @result = JSON.parse(@content, symbolize_names: true)
      binding.pry
      Movie.create(title: @result[:title], tmdb_id: @result[:id], imdb_id: @result[:imdb_id])
      @movie = Movie.find_by_tmdb_id(@tmdb_id)
      @listing.movie_id = @movie.id
    end
    #check by tmdb_id (or imdb_id actually, to make it flexible in case the API craps out)
    #to see if the movie is already in the database
    #if it does exist, then create the listing.
    #if it does not exist, create the movie by perofrming the API call based on ID, parsing the response
    #with a method that should live in movie.rb, then create the listing.


    respond_to do |format|
      if @listing.save
        format.html { redirect_to movies_path, notice: 'added to your list.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing = current_user.listings.find_by("list_id = ? AND movie_id = ?", params[:list_id], params[:movie_id])
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to movies_path, notice: 'Movie was removed from list.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def listing_params
    params.require(:listing).permit(:list_id, :movie_id)
  end

end
