class Article < ActiveRecord::Base
  has_one :friendly_url, validate: true
end
