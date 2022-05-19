class BookmarksController < ApplicationController
  def create
    board = Board.find(params[:board_id])
    current_user.bookmark(board)
    redirect_back fallback_location: root_path, success: t('.success')
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(board_id: params[:id])
    bookmark.destroy!
    redirect_to request.referer, success: t('.success')
  end
end
