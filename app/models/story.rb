class Story < ActiveRecord::Base
  before_save :set_rate

  belongs_to :category

  validates :body, presence: true, if: :count?

  protected

  def set_rate
    self.rate = 0 if self.rate == nil
  end

  def count? 
    if body.split(" ").count < 6 || body.split(" ").count > 6
      errors.add(:body, "only 6 words can be!")
      return false
    end
  end

end
