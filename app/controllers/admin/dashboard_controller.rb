class Admin::DashboardController < ApplicationController
  before_action :require_login

  layout 'admin'

  def index
    uri = URI("http://localhost:3000/get_pending_changes")

    req = Net::HTTP::Get.new(uri)
    req['Content-Type'] = 'application/json'
    req['Accept'] = 'application/json'

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    json = JSON.parse(res.body)
    @changes = json
  end
end
