class Admin::BoardsController < Admin::BaseController
  before_action :set_board, only: %i[show edit update destroy]
  def index
    @q = Board.ransack(params[:q])
    @boards = @q.result(dintinct: true).order(:title).page params[:page]
  end

  def new
  end

  def show
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to admin_board_path, success: '登録成功'
    else
      flash.now[:danger] = '登録失敗'
      render :edit
    end
  end

  def destroy
    @board.destroy!
    redirect_to admin_boards_path, success: '削除成功'
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end

end
