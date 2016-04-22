class Choice < ActiveRecord::Base
  has_many :responses
  belongs_to :question

  def color

  end
end
