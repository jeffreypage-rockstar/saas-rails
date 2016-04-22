class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices
  has_many :responses, through: :choices

  accepts_nested_attributes_for :choices, :reject_if => :all_blank, :allow_destroy => true
end
