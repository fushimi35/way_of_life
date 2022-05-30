class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      @comments = Board.find(params[:board_id]).comments.order(created_at: :desc)
      # redirect_to board_path(@comment.board), success: t('defaults.message.created', item: Comment.model_name.human)
    else
      p "aaa"
      # render "error", {comment: @comment}
      # redirect_to board_path(@comment.board), danger: t('defaults.message.not_created', item: Comment.model_name.human) 
    end
  end
  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end
  private
  def comment_params
    params.require(:comment).permit(:body).merge(board_id: params[:board_id])
  end
end
