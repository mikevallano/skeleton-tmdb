class AddTmdbIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :tmdb_id, :integer
    add_column :movies, :imdb_id, :integer
  end
end
