# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  deleted_at :datetime
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_boards_on_deleted_at  (deleted_at)
#

class Board < ApplicationRecord
    acts_as_paranoid
end
