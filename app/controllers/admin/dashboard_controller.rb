class Admin::DashboardController < ApplicationController
  before_action :require_login

  COMPARABLE_ATTRIBUTES = %w(kind materials latitude longitude street_name zip_code city opening_hours).freeze

  layout 'admin'

  def index
    # Get pending changes and pass to view
    res = ChangeSubmission.get_pending_changes
    @changes = res
  end

  def submit_change
    # Filter permitted parameters
    permitted = ChangeSubmission.permitted_params(params)

    # Set admin token and email
    user_id = session[:user_id]
    permitted['admin_token'] = ChangeSubmission.get_admin_token(user_id)
    permitted['email'] = User.find(user_id).email

    # Format to JSON
    body = permitted.to_json

    # Get response
    res = ChangeSubmission.submit_response(body)

    # Raise error if request head wasn't ok
    raise "Couldn't send request" if res.code != "200"
  end
end
