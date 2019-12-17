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
require 'openssl'
class Response < ApplicationRecord
  acts_as_paranoid
  belongs_to :board
  validates :name, presence: true
  validates :content, presence: true

  before_save :create_no
  before_save :create_id

  def create_no
    ids = self.board.responses.pluck(:reply_id)
    now_id = ids.max.presence || 0
    self.reply_id = now_id+1
  end

  def create_id
    ip = self.ipaddress
    timestamp = I18n.l(Date.today)
    secret = "Machiko"; 
  
    id_hash = OpenSSL::HMAC::hexdigest(OpenSSL::Digest::SHA256.new, secret, "#{timestamp}#{ip}")
  
    id_base64 = Base64.strict_encode64(id_hash)
    self.user_id =  id_base64.slice(0, 8)
  end
end
