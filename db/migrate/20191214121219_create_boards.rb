# frozen_string_literal: true

class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :boards, :deleted_at
  end
end
