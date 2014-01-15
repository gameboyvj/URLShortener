class Visit

  validate :user_id
  validate :shortened_url_id

  def self.record_visit!(user, shortened_url)

  end

end