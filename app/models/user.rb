
class User < ActiveRecord::Base
  attr_accessible :id, :email
  validates :email, :uniqueness => true

  has_many(
    :submitted_urls,
    :class_name => "shortened_url",
    :foreign_key => :submitter_id,
    :primary_key => :id
  )

  has_many(
  :visited_urls,
  :class_name => "Visit",
  :foreign_key => :user_id
  :primary_key => :id
  )

  # has_many :visited_urls, :through => :submitted_urls, :source => :visitors



  # def initialize(email)
#     @email = email
#   end
end
