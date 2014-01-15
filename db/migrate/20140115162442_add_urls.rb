class AddUrls < ActiveRecord::Migration
  def up
    create_table :shortened_urls do |t|
      t.string :short_url
      t.text :long_url
      t.integer :submitter_id

      t.timestamps
    end
    add_index :shortened_urls, :submitter_id
    add_index :shortened_urls, :short_url
  end

  def down
    drop_table :shortened_urls
  end
end
