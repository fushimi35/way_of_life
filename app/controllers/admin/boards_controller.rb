class Admin::BoardsController < Admin::BaseController
  before_action :set_board, only: %i[show edit]
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

  private

  def set_board
    @board = Board.find(params[:id])
  end

end
