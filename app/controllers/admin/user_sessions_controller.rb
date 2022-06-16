class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :require_login
  layout 'admin_login'
  def new
  end
  def create
  end
  def destroy
  end
end
