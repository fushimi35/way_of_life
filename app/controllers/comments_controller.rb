class CommentsController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @comment = @board.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to board_path(@board), success: t('defaults.message.created', item: Comment.model_name.human)
    else
      @comments = @board.comments.all
      flash.now[:danger] = t('defaults.message.not_created', item: Comment.model_name.human) 
      render 'boards/show' 
    end
  end
  def comment_params
    params.require(:comment).permit(:body)
  end
end
