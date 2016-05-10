class Response < ActiveRecord::Base
  belongs_to :choice
  scope :with_comment, -> {where('comment IS NOT NULL')}
  validates :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
