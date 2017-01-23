class Comment < ApplicationRecord
  default_scope { order('comments.created_at DESC') }

  validates :text, presence: true, length: { in: 5..500 }
  before_validation :strip_whitespace

  private
  def strip_whitespace
    self.text = self.text.strip unless self.text.blank?
  end
end
