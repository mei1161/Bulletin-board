# frozen_string_literal: true

# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  deleted_at :datetime
#  email      :string
#  image      :string
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

require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
