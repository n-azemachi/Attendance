class AddImageIdToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :image_id, :string
  end
end
