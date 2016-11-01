class Request < ActiveRecord::Base
  def self.post(path, body, content_type = "json")
<<<<<<< HEAD
    http_req(path, "post", body.to_json)
  end

  def self.get(path, content_type = "json")
    http_req(path, "get")
  end

  def self.put(path, body, content_type = "json")
    http_req(path, "put", body)
=======
    res = http_req(path, "post", body.to_json)
  end

  def self.get(path, content_type = "json")
    res = http_req(path, "get")
  end

  def self.put(path, body, content_type = "json")
    res = http_req(path, "put", body)
>>>>>>> 1e1337c7438d6bc2e47e4e1bb78685d8f7489554
  end

  def self.http_req(path, type, body = "", content_type = "json")
    uri = URI(path)

    # Handle the different CRUD operations
    case type
      when "post"
        req = Net::HTTP::Post.new(uri)
        req.body = body
      when "get"
        req = Net::HTTP::Get.new(uri)
      when "put"
        req = Net::HTTP::Put.new(uri)
        req.body = body
    end

    # Choose content type
    case content_type
      when "json"
        req.content_type = 'application/json'
        req['Content-Type'] = 'application/json'
        req['Accept'] = 'application/json'
    end

    # Return response
<<<<<<< HEAD
    Net::HTTP::start(uri.hostname, uri.port) {|http|
=======
    res = Net::HTTP::start(uri.hostname, uri.port) {|http|
>>>>>>> 1e1337c7438d6bc2e47e4e1bb78685d8f7489554
      http.request(req)
    }
  end
end
