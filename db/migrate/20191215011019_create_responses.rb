# frozen_string_literal: true

class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.string :name
      t.integer :reply_id
      t.string :user_id
      t.string :email
      t.text :content, null: false
      t.string :ipaddress
      t.references :board, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :responses, :deleted_at
  end
end
