class Admin::UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(dintinct: true)
  end

  def new
  end

  def show
  end

  def edit
  end
end
