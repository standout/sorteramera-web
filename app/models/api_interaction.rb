class APIInteraction < ApplicationRecord
  def self.get_pending_changes
    res = Request.get(API_PATH + "/pending_changes")
    JSON.parse(res.body)
  end

  # Submit specified changes
  def self.submit_response(body)
    res = Request.put(API_PATH + "/apply_change", body)
  end

  # Get authenticity token from server
  def self.get_token(email, password)
    credentials = { email: email, password: password }
    res = Request.post(API_PATH + "/authenticate", credentials)

    if res.message == "OK"
      return JSON.parse(res.body)['auth_token']
    else
      return nil
    end
  end
end
