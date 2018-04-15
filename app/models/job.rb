class Job < ApplicationRecord
  belongs_to :employer

  def day_of_month
    self.created_at.strftime("%d")
  end

  def month
    self.created_at.strftime("%b")
  end
end
