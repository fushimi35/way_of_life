class BoardsController < ApplicationController
  before_action :set_board, only:%i[edit update destroy]
  def index
    @q = Board.ransack(params[:q])
    @boards = @q.result.includes(:user,:bookmarks).order(created_at: :desc).page(params[:page])
    p @q
    p @boards
  end
  def new
    @board = current_user.boards.new()
  end
  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to boards_path, success: t('defaults.message.created', item: Board.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Board.model_name.human)
      render :new
    end
  end
  def show
    @board = Board.find(params[:id])
    @comments = @board.comments.includes(:user).order(created_at: :DESC)
    @comment = @board.comments.new()
  end
  def edit; end
  def update
    if @board.update(board_params)
      redirect_to @board, success: t('defaults.message.updated', item: Board.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Board.model_name.human)
      render :edit
    end
  end
  def destroy
    @board.destroy!
    redirect_to boards_path, success: t('defaults.message.deleted', item: Board.model_name.human)
  end
  def bookmarks
    @q = current_user.likes.ransack(params[:q])
    @bookmarks = @q.result.includes(:user).order(created_at: :DESC).page(params[:page])
  end
  
  private
  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end
  def set_board
    @board = current_user.boards.find(params[:id])
  end
end
