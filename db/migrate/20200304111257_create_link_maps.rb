class CreateLinkMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :link_maps do |t|
      t.string :original_url
      t.string :short_data
      t.integer :clicks, default: 0

      t.timestamps
    end
    add_index :link_maps, :original_url, unique: true
    add_index :link_maps, :short_data, unique: true
  end
end
