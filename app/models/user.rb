
class User < ActiveRecord::Base
  validates :email, :uniqueness => true

  has_many(
    :shortened_urls,
    :class_name => "shortened_url",
    :foreign_key => :submitter_id,
    :primary_key => :id
  )

  def self.create_for_user_and_long_url!(user, url)
    # Shortened_url()
  end


end
