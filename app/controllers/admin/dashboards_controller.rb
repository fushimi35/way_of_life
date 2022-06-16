class Admin::DashboardsController < Admin::BaseController
  skip_before_action :require_login
  layout 'admin/layouts/application'
  def index
  end
end
