# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  deleted_at :datetime
#  email      :string
#  ipaddress  :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer          not null
#  reply_id   :integer
#  user_id    :string
#
# Foreign Keys
#
#  board_id  (board_id => boards.id)
#

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
