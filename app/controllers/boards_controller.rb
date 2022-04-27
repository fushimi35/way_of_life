class BoardsController < ApplicationController
  def index
    @boards = Board.all.includes(:user).order(created_at: :desc)
  end
  def new
    @board = current_user.boards.new()
    binding.pry
  end
  def create
    @board = current_user.boards.new(board_params)
    binding.pry
    if @board.save
      redirect_to boards_path, success: t('defaults.message.created', item: Board.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Board.model_name.human)
      render :new
    end

  end

  private
  def board_params
    params.require(:board).permit(:title, :body, :avatar_path, :avatar_path_cache)
  end
end
