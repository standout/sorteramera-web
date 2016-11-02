class Admin::DashboardController < ApplicationController
  before_action :require_login

  COMPARABLE_ATTRIBUTES = %w(kind materials latitude longitude street_name zip_code city opening_hours).freeze

  layout 'admin'

  def index
    # Get pending changes and pass to view
    res = APIInteraction.get_pending_changes
    @changes = res
  end

  def submit_change
    # Filter permitted parameters
    trash = %w(authenticity_token utf8 controller action)
    permitted = params.except(*trash).permit!

    # Set admin token and email
    permitted[:admin_token] = session[:admin_token]
    binding.pry
    # Format to JSON
    body = permitted.to_json

    # Get response
    res = APIInteraction.submit_response(body)

    # Raise error if request head wasn't ok
    raise "Couldn't send request" if res.code != "200"
  end
end
