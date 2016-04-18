class LandingPage < ActiveRecord::Base
  belongs_to :survey

  validates :headline, presence: true
  validates :subtitle, presence: true
end
