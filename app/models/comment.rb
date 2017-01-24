class Comment < ApplicationRecord
  default_scope { order('comments.created_at DESC') }

  validates :text, presence: true, length: { in: 5..500 }
  before_validation :strip_whitespace

  private
  def strip_whitespace
    #DB already strips whitespace; so I want to make sure the validations catch that.
    self.text = self.text.strip unless self.text.nil?
  end
end
