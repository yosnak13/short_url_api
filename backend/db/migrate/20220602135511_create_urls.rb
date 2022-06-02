class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :original_url, null: false
      t.string :short_url, null: false, limit: 30
      t.timestamps
    end
  end
end
