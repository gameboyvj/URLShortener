
class User < ActiveRecord::Base
  attr_accessible :id, :email
  validates :email, :uniqueness => true

  has_many(
    :submitted_urls,
    :class_name => "shortened_url",
    :foreign_key => :submitter_id,
    :primary_key => :id
  )



  # def initialize(email)
#     @email = email
#   end
end
