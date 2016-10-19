class Admin::DashboardController < ApplicationController
  before_action :require_login

  layout 'admin'

  def index
  end
end
