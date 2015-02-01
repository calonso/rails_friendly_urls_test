class CreateFriendlyUrls < ActiveRecord::Migration
  def change
    create_table :friendly_urls do |t|
      t.string :path
      t.string :slug
      t.string :controller
      t.string :action
      t.string :defaults
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :friendly_urls, :articles
    add_index :friendly_urls, :slug, unique: true
  end
end
