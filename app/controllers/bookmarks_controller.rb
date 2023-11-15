class BookmarksController < ApplicationController
  def index
    @bookmark = current_user.bookmarks.all
  end

  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)
    if !@bookmark.save
      flash[:notice] = "Something went wrong"
    end
    redirect_to request.referrer
  end

  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    post = @bookmark.post
    @bookmark.destroy
    redirect_to post
  end

  private
  def bookmark_params
      params.require(:bookmark).permit(:post_id)
  end
end