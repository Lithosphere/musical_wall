class Upvotes < ActiveRecord::Migration
  def change
      create_table :upvotes do |t|
      t.references :user
      t.references :song
      t.boolean :upvoted?
      t.timestamps
    end
  end
end
