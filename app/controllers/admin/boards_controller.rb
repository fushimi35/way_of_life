class Admin::BoardsController < Admin::BaseController
  before_action :set_board, only: %i[show edit update destroy]
  def index
    @q = Board.ransack(params[:q])
    @boards = @q.result(dintinct: true).order(created_at: :desc).page params[:page]
  end

  def new
  end

  def show
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to admin_board_path, success: t('defaults.message.updated', item: "掲示板")
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: "掲示板")
      render :edit
    end
  end

  def destroy
    @board.destroy!
    redirect_to admin_boards_path, success: t('defaults.message.deleted', item: "掲示板")
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end

end
