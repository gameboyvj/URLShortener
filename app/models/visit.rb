class Visit

  validate :user_id
  validate :shortened_url_id


  belongs_to(
    :users,
    :class_name => "User",
    :foreign_key => :user_id
    :primary_key => :id
  )

  belongs_to(
    :shortened_urls,
    :class_name => "ShortenedUrl",
    :foreign_key => :shortened_url_id
    :primary_key => :id
  )

  def self.record_visit!(user, shortened_url)
    v = Visit.new
    v.user_id = user.id
    v.shortened_url_id = shortened_url.id

    v.save!
  end

end