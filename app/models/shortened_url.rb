class ShortenedUrl < ActiveRecord::Base

  validate :short_url
  validate :long_url
  validate :submitter_id

  belongs_to(
  :submitter,
  :class_name => "User",
  :foreign_key => :submitter_id,
  :primary_key => :id
  )

  has_many(
  :visitors
  :class_name => "Visit"
  :foreign_key => :shortened_url_id
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

    u.save!
  end

  def num_clicks
    Visit.where(:shortened_url_id = self.id).count
  end

  def num_uniques
    Visit.where(:shortened_url_id = self.id).distince.count
  end

  def num_recent_uniques
    Visit.visitors.where(:date_created > 10.minutes.ago)
  end
end