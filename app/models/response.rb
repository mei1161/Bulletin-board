class Response < ApplicationRecord
  acts_as_paranoid
  belongs_to :board
  validates :name, presence: true
  validates :content, presence: true

  before_save :create_id

  def create_id
    ids = self.board.responses.pluck(:reply_id)
    now_id = ids.max.presence || 0
    self.reply_id = now_id+1
  end
end
