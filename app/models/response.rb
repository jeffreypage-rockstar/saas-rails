class Response < ActiveRecord::Base
  belongs_to :choice
  scope :with_comment, -> {where('comment IS NOT NULL')}

end
