class Story < ActiveRecord::Base
  # before_save :count

  validates :body, presence: true, if: :count?

  protected

  def count? 
    if body.split(" ").count < 6
      errors.add(:body, "only 6 words can be!")
      return false
    end
  end

end
