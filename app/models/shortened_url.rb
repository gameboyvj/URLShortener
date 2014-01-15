class ShortenedUrl < ActiveRecord::Base

  validate :short_url
  validate :long_url
  validate :submitter_id

  belongs_to(
  :user,
  :class_name => "User",
  :foreign_key => :submitter_id,
  :primary_key => :id
  )

  def self.random_code
    random = SecureRandom::urlsafe_base64
  end

  def self.create_for_user_and_long_url!(user, url)
    u = ShortenedUrl.new
    short = ShortenedUrl.random_code
    u.short_url = short
    u.long_url = url
    u.submitter_id = user.id

    save!
  end

end