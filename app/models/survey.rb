class Survey < ActiveRecord::Base
  belongs_to :user
  has_one :question
  has_one :landing_page
  has_many :responses, through: question

  validates :name, presence: true
end
