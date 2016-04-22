class Survey < ActiveRecord::Base
  belongs_to :user
  has_one :question
  has_one :landing_page
  has_many :responses, through: :question
  has_many :choices, through: :question

  accepts_nested_attributes_for :question
  accepts_nested_attributes_for :landing_page

  validates :name, presence: true
end
