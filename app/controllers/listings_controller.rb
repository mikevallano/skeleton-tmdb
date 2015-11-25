class ListingsController < ApplicationController

  def create
    @listing = Listing.new(listing_params)

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
    #find_by returns a record, as opposed to where, which returns a relation
    @listing = current_user.listings.find_by("list_id = ? AND movie_id = ?", params[:list_id], params[:id])
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
