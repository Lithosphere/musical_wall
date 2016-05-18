class AddSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :user
      t.string :song_title
      t.string :author
      t.string :url
      t.timestamps
    end
  end
end
