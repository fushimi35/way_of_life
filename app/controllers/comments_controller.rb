class CommentsController < ApplicationController
  def index
  end
  def create
    @board = Board.find(params[:board_id])
    binding.pry
    @comment = @board.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to board_path(@board)
    end
  end
  def comment_params
    params.require(:comment).permit(:body)
  end
end
