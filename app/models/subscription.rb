class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan

  def renew
    update_attibute :active_until, Date.today + 1.month
  end
end
