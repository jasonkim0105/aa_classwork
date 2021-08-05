class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url
      t.string :short_url
      t.ineger :user_id, null: false
    end

    
    add_index :shortened_urls, :long_url, :short_url, unique: true
  end
end
