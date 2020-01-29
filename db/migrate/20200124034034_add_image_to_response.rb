class AddImageToResponse < ActiveRecord::Migration[6.0]
  def change
    add_column :responses, :image, :string
  end
end
