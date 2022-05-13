class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.new(board_id: params[:board_id])
    if bookmark.save!
      redirect_to request.referer, success: t('defaults.message.bookmarked')
    end
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(board_id: params[:id])
    p bookmark
    bookmark.destroy!
    redirect_to request.referer, success: t('defaults.message.unbookmarked')
  end
end
