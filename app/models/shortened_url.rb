class ShortenedUrl < ActiveRecord::Base

  validates :short_url
  validates :long_url

end