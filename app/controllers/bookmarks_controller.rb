class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.pet = Pet.find(params[:pet_id])
    @bookmark.save
    redirect_to "/dashboard", status: :see_other
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to "/dashboard", status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:pet_id)
  end
end
