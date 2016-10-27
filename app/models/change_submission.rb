class ChangeSubmission < ApplicationRecord
  def self.permitted_params(params)
    trash = %w(authenticity_token utf8 controller action)
    params.except(*trash).permit!
  end

  def self.get_admin_token(user_id)
    require 'jwt'

    user = User.find(user_id)
    secret = user.secret

    JWT.encode({authorized: true}, secret, 'HS256')
  end

  def self.get_pending_changes
    uri = URI(API_PATH + "/get_pending_changes")

    req = Net::HTTP::Get.new(uri)
    req['Content-Type'] = 'application/json'
    req['Accept'] = 'application/json'

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    JSON.parse(res.body)
  end

  def self.submit_response(body)
    uri = URI(API_PATH + "/apply_change")
    req = Net::HTTP::Put.new(uri)
    req.body = body
    req.content_type = 'application/json'
    req['Content-Type'] = 'application/json'
    req['Accept'] = 'application/json'

    res = Net::HTTP::start(uri.hostname, uri.port) {|http|
      http.request(req)
    }
  end
end
