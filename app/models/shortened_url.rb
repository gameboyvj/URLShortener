class ShortenedUrl < ActiveRecord::Base

  validates :short_url
  validates :long_url
  validates :submitter_id

  belongs_to(
  :user,
  :class_name => "User",
  :foreign_key => :submitter_id,
  :primary_key => :id
  )

  def self.random_code
    random = SecureRandom::urlsafe_base64

  end

  def initialize

  end
end