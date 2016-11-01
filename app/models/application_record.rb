class ApplicationRecord < ActiveRecord::Base
  API_PATH = "http://localhost:3000"
  
  self.abstract_class = true
end
